# BEJO — Frontend (Flutter)

Aplikasi Android edukasi lingkungan bertema 3R (Reduce, Reuse, Recycle) dibungkus sebagai game tamagotchi gamified, untuk kompetisi ANFORCOM2026. User merawat tamagotchi, scan sampah lewat kamera (klasifikasi on-device via model TFLite) untuk dapat currency, mengerjakan quiz edukasi per-chapter, belanja aksesoris di shop/gacha, baca berita, dan chat dengan chatbot edukasi.

Repo ini adalah **frontend Flutter** — satu-satunya klien untuk backend di `../backend/` (Go+Echo) dan model klasifikasi sampah di `../model/` (YOLOv8→TFLite).

## Mulai dari Sini

Dokumentasi teknis lengkap ada di `docs/`, baca berurutan sesuai kebutuhan:

1. **[docs/PRD.md](docs/PRD.md)** — fitur, keputusan stack, constraints. Mulai dari sini untuk paham scope aplikasi.
2. **[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)** — layering, folder structure, networking, integrasi model TFLite.
3. **[docs/DATA_MODELS.md](docs/DATA_MODELS.md)** — model data Dart per entity.
4. **[docs/API_CLIENT.md](docs/API_CLIENT.md)** — cara konsumsi API, mapping error code, retry strategy.
5. **[docs/SCREENS.md](docs/SCREENS.md)** — inventori layar & alur navigasi.
6. **[docs/TASKS.md](docs/TASKS.md)** — breakdown sprint.
7. **[docs/DEFINITION_OF_DONE.md](docs/DEFINITION_OF_DONE.md)** — checklist sebelum anggap fitur selesai.
8. **[CONTRIBUTING.md](CONTRIBUTING.md)** — setup lokal, cara jalankan, convention.

Dokumen source of truth di repo lain yang sering dirujuk:

- `../backend/docs/API_CONTRACT.md` — kontrak endpoint REST (backend)
- `../backend/docs/DATABASE_SCHEMA.md` — skema data backend
- `../model/docs/INTEGRATION.md` — kontrak model TFLite untuk sisi app

## Quickstart

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080/api/v1
```

Lihat `CONTRIBUTING.md` untuk setup lengkap (termasuk menyiapkan file model TFLite) dan `docs/API_CLIENT.md` untuk variasi konfigurasi base URL.

## Stack

Flutter (Android-only MVP) · Riverpod · go_router · dio · freezed/json_serializable · ultralytics_yolo · flutter_secure_storage

Alasan tiap pilihan ada di `docs/PRD.md` §3.
