# PRD — ANFORCOM2026 Tamagotchi Education Frontend (Flutter)

**Status**: Draft, locked-in untuk MVP
**Last updated**: 2026-08-28
**Team**: 1 orang (solo developer)
**Deadline**: Kompetisi ANFORCOM2026, <1 bulan dari 2026-08-27 (mengikuti `backend/docs/PRD.md`)

## 1. Latar Belakang

Aplikasi Android edukasi lingkungan (tema 3R: Reduce, Reuse, Recycle) untuk kompetisi ANFORCOM2026, dibungkus sebagai game tamagotchi gamified agar edukasi lebih engaging. Dokumen ini adalah PRD sisi **frontend Flutter** — backend (Go+Echo) sudah lengkap didokumentasikan di `../backend/docs/` dan sebagian besar sudah diimplementasikan; model klasifikasi sampah (YOLOv8→TFLite) sudah lengkap didokumentasikan di `../model/docs/`. Frontend ini adalah satu-satunya klien yang mengonsumsi backend tersebut dan menjalankan model TFLite secara on-device.

Sumber kebenaran (source of truth) yang **wajib** dirujuk, bukan diduplikasi isinya:

- `../backend/docs/API_CONTRACT.md` — kontrak endpoint REST
- `../backend/docs/ARCHITECTURE.md` — response envelope, alur auth, idempotency
- `../backend/docs/DATABASE_SCHEMA.md` — struktur entity (acuan model data frontend)
- `../model/docs/INTEGRATION.md` — kontrak model TFLite (kelas, spesifikasi input/output, logika pencocokan)

## 2. Fitur Utama

### 2.1 Autentikasi
- Register (`POST /auth/register`) → kirim OTP (`POST /auth/send-otp`, dipakai ulang untuk resend) → verifikasi OTP (`POST /auth/verify-otp`) → login (`POST /auth/login`).
- Access token (TTL 15 menit) + refresh token (TTL 30 hari) disimpan di `flutter_secure_storage`. Refresh token dirotasi setiap kali dipakai (`POST /auth/refresh`) — token lama otomatis invalid, app **wajib** selalu menyimpan pasangan token terbaru hasil refresh.
- Logout (`POST /auth/logout`) menghapus token lokal + revoke refresh token di server.
- Tidak ada alur "lupa password" di MVP ini (tidak ada di `API_CONTRACT.md` — dicatat sebagai non-goal, bukan terlewat).

### 2.2 Tamagotchi Care
- Tampilkan state tamagotchi (`GET /tamagotchi/me`): happiness, growth_stage, aksesoris terpasang.
- Aksi feed (`POST /tamagotchi/me/feed`) dan equip aksesoris (`POST /tamagotchi/me/equip`).
- Happiness juga naik lewat Quiz Happiness (lihat 2.5).

### 2.3 Scan Sampah untuk Currency
- Model klasifikasi (YOLOv8 TFLite, 6 kelas: `organik`, `anorganik`, `B3`, `tong_organik`, `tong_anorganik`, `tong_B3`) berjalan **100% on-device** lewat plugin `ultralytics_yolo`. App **tidak pernah** mengirim gambar mentah ke backend.
- App menjalankan logika pencocokan sampah↔tong secara lokal (lihat `docs/ARCHITECTURE.md` §Integrasi Model TFLite, diturunkan dari `../model/docs/INTEGRATION.md`), lalu mengirim **hasil akhir saja** (`classified_label`, `confidence` opsional) ke `POST /waste-scan/submit` untuk dikreditkan currency.
- Endpoint ini butuh header `Idempotency-Key` (lihat 2.11).

### 2.4 Modul Edukasi 3R
- Materi ringkasan per-chapter **di-bundle sebagai local asset** di app (JSON/Markdown di `assets/chapters/`) — tidak diambil dari backend, sesuai `../backend/docs/PRD.md` §2.4.
- Status unlock/progress chapter diambil dari backend (`GET /chapters`) — app **tidak** menyimpan progress sendiri, backend adalah source of truth.
- Quiz per-chapter (`GET /chapters/:id/quiz`, `POST /chapters/:id/quiz/submit`) terpisah dari quiz happiness. Reward currency hanya diberikan sekali seumur hidup per chapter (backend yang menegakkan aturan ini via `reward_claimed_at`) — app cukup menampilkan hasil apa adanya dari response, tidak mengasumsikan reward selalu didapat saat lulus ulang.
- Ada daily cap jumlah attempt quiz per user per hari (baik happiness maupun chapter) — app wajib menangani error `DAILY_CAP_REACHED` dengan pesan yang jelas, bukan retry otomatis.

### 2.5 Quiz Happiness
- `GET /quiz/happiness` ambil soal acak, `POST /quiz/happiness/submit` submit jawaban. Jawaban benar menaikkan happiness tamagotchi.

### 2.6 Berita Harian
- `GET /news` (paginated) — app hanya menampilkan hasil, tidak pernah memanggil GNews langsung (backend yang cache).

### 2.7 Chatbot
- `POST /chatbot/sessions` mulai sesi, `POST /chatbot/sessions/:id/messages` kirim pesan, `GET /chatbot/sessions/:id/messages` ambil history.
- App wajib menangani error `PROMPT_GUARD_BLOCKED` (422) dengan pesan yang menjelaskan bahwa pesan di luar topik edukasi 3R, bukan error generik.

### 2.8 Shop & Gacha
- `GET /shop/accessories` katalog, `POST /shop/accessories/:id/purchase` beli langsung, `POST /shop/gacha/pull` gacha random, `GET /shop/my-accessories` inventory.
- Purchase dan gacha butuh header `Idempotency-Key` (lihat 2.11). App wajib menangani `INSUFFICIENT_CURRENCY` dengan UI yang jelas (bukan biarkan request gagal generik).

### 2.9 Profil User
- `GET /profile/me`, `PATCH /profile/me`, upload avatar (`POST /profile/me/avatar`, multipart, max 5MB, JPG/PNG/WebP — validasi ukuran/tipe di client **sebelum** upload untuk hemat kuota & UX cepat, backend tetap validasi ulang).

### 2.10 Admin — Non-Goal
- Admin panel backend adalah **API-only tanpa web UI** (`../backend/docs/PRD.md` §2.10). Frontend Flutter ini **tidak** membangun UI admin apapun — di luar scope aplikasi konsumen.

### 2.11 Idempotency-Key
- Tiga endpoint yang mengubah saldo currency (`waste-scan/submit`, `shop/accessories/:id/purchase`, `shop/gacha/pull`) **wajib** menyertakan header `Idempotency-Key: <uuid>`. App generate UUID v4 di client sebelum request, dan **wajib pakai UUID yang sama** saat retry request yang sama (misal setelah timeout/network error) — key kadaluarsa 24 jam di server. Detail implementasi lihat `docs/ARCHITECTURE.md`.

## 3. Keputusan Teknis Terkunci

| Area | Keputusan | Alasan |
|---|---|---|
| Platform | Android saja (MVP) | Mengikuti `../backend/docs/PRD.md` §1, sesuai target kompetisi |
| Framework | Flutter (stable channel terbaru) | Ditentukan sejak awal proyek |
| State management | Riverpod | Compile-safe (tanpa `BuildContext` lookup runtime), testable tanpa widget tree, cocok untuk solo dev dengan banyak async state (auth, currency, tamagotchi) |
| Navigasi | go_router | Standar de-facto Flutter untuk declarative routing + deep link, terintegrasi baik dengan Riverpod (`refreshListenable`/`redirect` untuk guard auth) |
| HTTP client | dio | Interceptor first-class (wajib untuk auto-refresh token & Idempotency-Key), lebih ekspresif dibanding `http` untuk kebutuhan ini |
| Model data | freezed + json_serializable | Immutable data class + union type (berguna untuk state loading/success/error) + JSON codegen, konsisten dengan gaya type-safety backend Go |
| Deteksi objek (waste scan) | `ultralytics_yolo` (plugin resmi) | Menangani live camera feed, pre/post-processing (resize, normalize, NMS, box decode) otomatis untuk model YOLOv8 TFLite — menghindari implementasi NMS manual di Dart yang rawan bug. Compatible langsung dengan `best_int8.tflite`/`best_float32.tflite` hasil export `../model/scripts/export_tflite.py` — bukan format berbeda, plugin ini justru wrapper level-tinggi di atas `tflite_flutter` untuk model TFLite yang sama. |
| Token storage | flutter_secure_storage | Access + refresh token adalah credential sensitif, tidak boleh di `SharedPreferences` biasa (plaintext) |
| Konten chapter 3R | Local asset (JSON di `assets/chapters/`) | Mengikuti keputusan backend PRD §2.4 — materi tidak disajikan lewat API, hanya soal quiz yang lewat backend |
| Testing | `flutter_test` (widget) + `mocktail` (mock repository/provider untuk unit test) | Standar ekosistem Flutter, mocktail tidak butuh code-gen tambahan (lebih cepat untuk deadline ketat) |

## 4. Constraints & Non-Goals

- Android-only, tidak ada target iOS/web/desktop di MVP ini.
- Tidak ada UI admin (lihat 2.10).
- Tidak ada real-money transaction/IAP — currency murni in-app (mengikuti backend).
- Inferensi CV 100% on-device — app tidak pernah mengirim gambar mentah ke backend untuk waste scan.
- Materi edukasi (teks 3R) tidak diambil dari API — bundled lokal.
- Tidak ada mode offline penuh — fitur yang butuh backend (auth, tamagotchi, quiz, shop, news, chatbot) butuh koneksi internet. Hanya materi chapter yang bisa dibaca offline (karena bundled).

## 5. Dokumen Terkait

- `docs/ARCHITECTURE.md` — layering, folder layout, networking, integrasi model TFLite
- `docs/DATA_MODELS.md` — model data Dart per entity
- `docs/API_CLIENT.md` — cara konsumsi API dari sisi Flutter (referensi cepat, bukan pengganti `../backend/docs/API_CONTRACT.md`)
- `docs/SCREENS.md` — inventori layar & alur navigasi
- `docs/TASKS.md` — breakdown sprint
- `docs/DEFINITION_OF_DONE.md` — checklist selesai per fitur
- `../CONTRIBUTING.md` (root frontend) — setup lokal & convention
- `../backend/docs/API_CONTRACT.md` — kontrak endpoint REST (source of truth)
- `../model/docs/INTEGRATION.md` — kontrak model TFLite (source of truth)

## 6. Decision Log

| Tanggal | Keputusan | Konteks |
|---|---|---|
| 2026-08-28 | Stack: Riverpod + go_router + dio + freezed/json_serializable + ultralytics_yolo + flutter_secure_storage; konten chapter bundled sebagai local asset JSON | Interview awal penyusunan documentation pack |
| 2026-08-28 | Scope tahap ini: hanya dokumentasi teknis (PRD, ARCHITECTURE, DATA_MODELS, API_CLIENT, SCREENS, TASKS, DEFINITION_OF_DONE, CONTRIBUTING, README), tanpa scaffold kode Flutter dulu | Keputusan user saat approve plan |
| 2026-08-28 | Tim: solo developer — sprint breakdown linear tanpa pembagian paralel | Interview awal |
