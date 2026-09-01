# Architecture — ANFORCOM2026 Tamagotchi Frontend (Flutter)

Referensi keputusan lengkap: `docs/PRD.md`. Kontrak backend: `../backend/docs/API_CONTRACT.md` + `../backend/docs/ARCHITECTURE.md`. Kontrak model: `../model/docs/INTEGRATION.md`.

## 1. Layering

Feature-first, tiga lapis per domain, dependency mengalir satu arah — analog `handler → service → repository` di backend:

```
Presentation (Widget/Screen)  →  Application (Riverpod Notifier/Controller)  →  Data (Repository → API/local source)
```

- **Presentation**: Widget & screen. Baca state dari provider, kirim event/aksi ke Notifier. **Tidak** ada pemanggilan `dio`/repository langsung dari widget.
- **Application**: Riverpod `Notifier`/`AsyncNotifier` per fitur — business logic sisi client (mis. validasi form sebelum submit, keputusan navigasi setelah sukses/gagal, transformasi state loading/error). Bergantung pada repository lewat abstraksi (interface/typedef), bukan `Dio` langsung, supaya bisa di-mock saat unit test.
- **Data**: Repository — satu-satunya lapisan yang bicara ke `ApiClient` (dio) atau sumber lokal (secure storage, asset JSON). Expose method per domain (mis. `AuthRepository`, `TamagotchiRepository`), return model `freezed` yang sudah di-parse dari envelope response.

Aturan: presentation tidak boleh import `dio`/`ApiClient` langsung; application tidak boleh import Flutter widget (`material.dart`) — supaya business logic tetap testable tanpa widget tree.

## 2. Folder Layout

```
lib/
  main.dart                    # entrypoint: init ProviderScope, jalankan app

  core/
    network/
      api_client.dart          # dio instance + base config
      auth_interceptor.dart    # inject Authorization header, auto-refresh token
      idempotency.dart         # generator+cache Idempotency-Key per request
      api_exception.dart       # mapping error envelope -> exception typed
    storage/
      secure_storage.dart      # wrapper flutter_secure_storage (token)
    router/
      app_router.dart          # go_router config, redirect guard auth
    theme/                     # ThemeData, warna, typography

  features/
    auth/
      presentation/            # screen register, otp, login
      application/             # AuthNotifier (state: unauthenticated/otpPending/authenticated)
      data/                    # AuthRepository
    profile/
    tamagotchi/
    waste_scan/
      presentation/            # camera screen, hasil scan
      application/             # WasteScanNotifier
      data/                    # WasteScanRepository (submit ke backend)
      ml/                      # wrapper ultralytics_yolo, matching logic sampah<->tong
    chapters/                  # list, detail (baca asset lokal), quiz chapter
    quiz_happiness/
    shop/                      # katalog, purchase, gacha, my-accessories
    news/
    chatbot/

  shared/
    widgets/                   # widget reusable lintas fitur (loading, error state, dsb)
    models/                    # model bersama jika dipakai >1 fitur

assets/
  chapters/                    # JSON/Markdown materi 3R per chapter (bundled, lihat docs/DATA_MODELS.md)
  model/
    best_int8.tflite           # hasil export ../model/scripts/export_tflite.py (rekomendasi utama)
    best_float32.tflite        # fallback, hanya di-load jika int8 terbukti kurang akurat saat testing
    labels.txt                 # urutan kelas — WAJIB sama persis dengan ../model/docs/INTEGRATION.md

test/
  features/<domain>/           # unit test Notifier + Repository (mock)
  widget/                      # widget test screen kritis
```

Prinsip: `features/<domain>` = satu fitur, tiga sub-folder inti (`presentation/application/data`). `core/` hanya untuk kode lintas-fitur (networking, storage, router).

## 3. Networking Layer

### 3.1 Response Envelope

Backend selalu balas format konsisten (`../backend/docs/ARCHITECTURE.md` §6):

```json
{ "success": true, "data": { ... }, "error": null }
{ "success": true, "data": [...], "error": null, "meta": { "total": 100, "page": 1, "limit": 20 } }
{ "success": false, "data": null, "error": { "code": "INVALID_OTP", "message": "..." } }
```

`ApiClient` (dio) punya satu interceptor yang men-decode envelope ini untuk semua response. Jika `success == false`, interceptor melempar `ApiException(code, message)` — repository dan lapisan atas **tidak pernah** parsing `response.data['success']` manual berulang-ulang di tiap tempat.

### 3.2 Auth Interceptor & Token Refresh

Access token TTL 15 menit (`backend/.env.example: JWT_ACCESS_TTL_MINUTES=15`) — pendek, jadi refresh **wajib** otomatis dan transparan ke user:

1. Setiap request keluar: interceptor `onRequest` menyisipkan `Authorization: Bearer <access_token>` dari `SecureStorage` (kecuali endpoint publik: `/auth/*` non-refresh, `/healthz`).
2. Jika response `401 UNAUTHORIZED`: interceptor `onError` menahan request yang gagal, panggil `POST /auth/refresh` dengan refresh token tersimpan.
   - Sukses → simpan pasangan access+refresh token **baru** (refresh lama sudah dirotasi/invalid di server, lihat `backend/docs/ARCHITECTURE.md` §3), lalu **retry** request asli dengan token baru.
   - Gagal (refresh token juga invalid/expired) → clear storage, redirect ke layar login (lewat `AuthNotifier` state → `go_router redirect`).
3. **Concurrency guard**: jika beberapa request gagal 401 bersamaan, hanya satu proses refresh yang jalan (pakai `Completer`/lock di interceptor) — request lain menunggu hasil refresh yang sama, bukan memicu banyak refresh paralel (yang akan saling meng-invalid-kan refresh token karena rotasi).

### 3.3 Idempotency-Key

Tiga endpoint (`waste-scan/submit`, `shop/accessories/:id/purchase`, `shop/gacha/pull`) butuh header `Idempotency-Key: <uuid>` (`../backend/docs/API_CONTRACT.md` §Header). Aturan implementasi:

- Key digenerate (`uuid` package, v4) **sekali** di titik mulai aksi user (mis. saat tombol "Scan" ditekan), **sebelum** request dikirim.
- Key yang sama dipakai ulang untuk **retry** request yang identik (mis. setelah timeout atau app menampilkan tombol "coba lagi" untuk request yang sama) — supaya backend me-replay response pertama, bukan eksekusi ulang (cegah double-credit currency).
- Key **baru** digenerate untuk aksi baru yang berbeda (scan foto baru, purchase item lain).
- Key kadaluarsa 24 jam di server — app tidak perlu logic expiry sendiri, cukup tidak reuse key lintas sesi aksi yang berbeda.

### 3.4 Error Code Mapping

Semua kode di `../backend/docs/API_CONTRACT.md` §Error Codes di-mapping ke pesan UI Bahasa Indonesia via `docs/API_CLIENT.md` — application layer menerima `ApiException` typed (bukan string mentah) dan menentukan UI state (dialog/snackbar/inline error) sesuai kode, bukan menampilkan `error.message` mentah dari server untuk semua kasus (beberapa butuh copy yang lebih ramah, mis. `DAILY_CAP_REACHED`).

## 4. Integrasi Model TFLite (Waste Scan)

Sesuai `../model/docs/INTEGRATION.md` — **wajib dibaca ulang sebelum implementasi**, ini ringkasannya dari sisi arsitektur app:

1. **Plugin**: `ultralytics_yolo` — load `assets/model/best_int8.tflite` (default) via `ObjectDetector`/`YoloView`, sudah menangani live camera feed + pre-processing (resize 640x640, normalize) + post-processing (NMS, box decode) secara internal.
2. **Urutan kelas** (harus identik dengan `assets/model/labels.txt`, jangan hardcode urutan berbeda):
   ```
   0: organik        3: tong_organik
   1: anorganik      4: tong_anorganik
   2: B3             5: tong_B3
   ```
3. **Matching logic** (diimplementasikan di `features/waste_scan/ml/`, bukan bagian plugin):
   - Dari hasil deteksi 1 frame, pisahkan kelas **sampah** (`organik`/`anorganik`/`B3`) vs kelas **tong** (`tong_organik`/`tong_anorganik`/`tong_B3`).
   - Kalau salah satu grup tidak terdeteksi di frame → **jangan** tentukan benar/salah, tampilkan UI "arahkan kamera ke sampah & tong bersamaan".
   - Kalau ada beberapa deteksi sekaligus dalam satu grup → ambil confidence tertinggi.
   - Cocokkan pasangan (`organik`↔`tong_organik`, dst.) → benar/salah.
   - Hasil akhir (label sampah yang match + confidence) dikirim ke `WasteScanRepository.submit()` → `POST /waste-scan/submit` dengan `Idempotency-Key` (§3.3).
4. **Fallback float32**: jika saat testing device fisik (bukan emulator) akurasi `best_int8.tflite` ternyata buruk, pindah default ke `best_float32.tflite` — jangan asumsikan int8 selalu cukup, harus dites di device fisik low-end (lihat `docs/DEFINITION_OF_DONE.md`).
5. **Tidak pernah** kirim raw image ke backend — hanya hasil klasifikasi akhir (lihat `docs/PRD.md` §2.3).

## 5. Local Content (Materi Chapter 3R)

- Materi ringkasan tiap chapter disimpan sebagai file JSON statis di `assets/chapters/chapter_<id>.json` (skema di `docs/DATA_MODELS.md`), dibaca lewat `rootBundle` — tidak ada network call untuk konten ini.
- Metadata chapter (unlock status, `reward_currency`, urutan) tetap dari backend (`GET /chapters`) — app mencocokkan `id` dari response backend dengan file asset lokal by convention (`chapter_<id>.json`). Jika asset untuk suatu `id` tidak ditemukan, tampilkan state error eksplisit (bukan crash) — kemungkinan asset belum di-bundle untuk chapter baru yang ditambahkan admin.
- Tidak ada versioning kompleks di MVP — update materi = update asset + rebuild app (dicatat sebagai tech debt kalau butuh update konten tanpa rebuild nanti).

## 6. State Management (Riverpod)

- Satu `Notifier`/`AsyncNotifier` per fitur utama, expose state sebagai sealed-ish union lewat `freezed` (`AsyncValue` bawaan Riverpod sudah cukup untuk loading/data/error — dipakai langsung, tidak reinvent).
- Provider untuk data yang dipakai lintas fitur (mis. `currentUserProvider`, `currencyBalanceProvider`) di-invalidate/refresh setelah aksi yang mengubahnya (mis. setelah waste scan sukses → invalidate `currencyBalanceProvider` supaya dashboard update).
- Auth state (`AuthNotifier`) adalah root guard untuk `go_router redirect` — semua route selain `/auth/*` redirect ke login jika `AuthNotifier.state` unauthenticated.

## 7. Testing Strategy

- **Unit test**: `application/` (Notifier) dengan `data/` (Repository) di-mock pakai `mocktail`. Fokus ke logic penting: matching sampah↔tong, mapping error code, auto-refresh token flow, daily-cap/insufficient-currency handling.
- **Widget test**: screen kritis (login/OTP flow, waste scan result, quiz submit, shop purchase) — pastikan loading/error/empty state ter-render, bukan cuma happy path.
- Tidak ada target coverage angka spesifik (berbeda dari backend yang 80%) — untuk solo dev+deadline ketat, prioritas: semua alur yang menyentuh currency/auth **wajib** ada test, sisanya best-effort (lihat `docs/DEFINITION_OF_DONE.md`).
- Test integrasi model TFLite **tidak** bisa di-unit-test bermakna (butuh device fisik) — diverifikasi manual via checklist `../model/docs/INTEGRATION.md` §Checklist sebelum integrasi.
