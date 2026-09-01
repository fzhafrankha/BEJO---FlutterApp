# Definition of Done — Frontend Flutter

Checklist ini berlaku untuk setiap task di `docs/TASKS.md` sebelum dianggap selesai (solo dev — self-check sebelum lanjut ke task berikutnya, bukan gate PR review seperti backend).

## Kode

- [ ] Mengikuti layering presentation→application→data (`docs/ARCHITECTURE.md` §1)
- [ ] Tidak ada pemanggilan `dio`/`ApiClient` langsung dari widget; tidak ada import `material.dart` di layer `application/`
- [ ] Repository diakses lewat Notifier/Controller, bukan dipanggil langsung dari widget
- [ ] Semua model response pakai `freezed`+`json_serializable`, tidak ada parsing `Map<String,dynamic>` manual bertebaran di widget
- [ ] Tidak ada base URL/secret/API key hardcoded di source — semua lewat `--dart-define` (`docs/API_CLIENT.md` §1)

## UI State

- [ ] Setiap screen yang fetch data punya state loading, error (dengan retry), dan — jika relevan — empty (`docs/SCREENS.md` per-screen)
- [ ] Setiap error code yang mungkin dikembalikan endpoint terkait sudah dipetakan ke pesan UI (`docs/API_CLIENT.md` §3), bukan menampilkan `error.message` mentah untuk semua kasus
- [ ] Aksi yang butuh `Idempotency-Key` (waste-scan submit, purchase, gacha) memakai key yang sama saat retry request yang sama (`docs/ARCHITECTURE.md` §3.3)

## Testing

- [ ] Unit test untuk business logic penting di layer `application/` (mock repository) — wajib untuk alur yang menyentuh currency/auth, best-effort untuk sisanya (`docs/ARCHITECTURE.md` §7)
- [ ] Widget test untuk screen kritis yang disebut di `docs/ARCHITECTURE.md` §7 mencakup minimal loading+error+success state
- [ ] `flutter test` lolos semua sebelum lanjut task berikutnya

## Device Fisik (khusus fitur kamera/TFLite)

- [ ] Fitur waste scan **sudah dites di device Android fisik**, bukan cuma emulator (emulator tidak punya kamera real & performa CPU/GPU beda jauh)
- [ ] Sudah dites kondisi frame yang cuma ada sampah tanpa tong dan sebaliknya — pastikan app tidak salah menyimpulkan benar/salah dari data tidak lengkap (`../model/docs/INTEGRATION.md` §Checklist)
- [ ] Sudah dibandingkan hasil `best_int8.tflite` vs `best_float32.tflite` di device fisik, dan dipilih default sesuai hasil (`docs/ARCHITECTURE.md` §4 poin 4)
- [ ] `labels.txt` yang dipakai urutannya sudah dicek sama persis dengan `../model/docs/INTEGRATION.md`

## Security

- [ ] Access & refresh token disimpan di `flutter_secure_storage`, tidak pernah di `SharedPreferences`/log/print
- [ ] Upload avatar divalidasi ukuran (max 5MB) & tipe file (JPG/PNG/WebP) di client sebelum kirim (`docs/API_CLIENT.md` §5)
- [ ] Tidak ada raw image sampah yang dikirim ke backend — hanya hasil klasifikasi (`docs/PRD.md` §2.3, non-negotiable untuk privasi & sesuai kontrak backend)

## Dokumentasi

- [ ] `docs/DATA_MODELS.md` diupdate jika bentuk response API aktual berbeda dari yang didokumentasikan (beberapa model masih ditandai "perlu konfirmasi saat integrasi")
- [ ] `docs/PRD.md` decision log diupdate jika ada keputusan arsitektur baru selama implementasi (format sama seperti backend)

## Pre-Demo (Sprint 5)

- [ ] Skenario demo end-to-end jalan tanpa crash: register → verifikasi OTP → login → scan sampah → dapat koin → belanja/gacha aksesoris → pasang ke tamagotchi → kerjakan 1 chapter quiz
- [ ] App tidak crash saat tidak ada koneksi internet di titik manapun (tampilkan error state, bukan crash)
- [ ] Build APK release (`flutter build apk --release --dart-define=API_BASE_URL=...`) berhasil dan sudah dites jalan di device yang akan dipakai demo
