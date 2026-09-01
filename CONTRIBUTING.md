# Contributing — ANFORCOM2026 Tamagotchi Frontend (Flutter)

## Setup Lokal

Prasyarat: Flutter SDK (stable channel terbaru), Android Studio/SDK (untuk build & emulator Android), backend berjalan lokal (lihat `../backend/CONTRIBUTING.md`).

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs   # generate freezed/json_serializable
```

### Menyiapkan Model TFLite

Model **tidak** disertakan di repo model (`../model/`) secara default (hasil training, besar & berubah tiap re-train). Sebelum menjalankan fitur waste scan:

1. Ambil hasil export terbaru dari `../model/runs/export/`: `best_int8.tflite`, `best_float32.tflite` (opsional), `labels.txt`.
2. Salin ke `assets/model/` di project frontend ini.
3. Pastikan `labels.txt` urutan kelasnya persis sesuai `../model/docs/INTEGRATION.md` (`organik, anorganik, B3, tong_organik, tong_anorganik, tong_B3`) — kalau beda, **jangan asumsikan urutan lain**, tanya balik ke sisi model (lihat catatan di dokumen tsb).
4. Daftarkan path di `pubspec.yaml` (`assets:` section) jika belum otomatis ter-cover oleh wildcard folder.

### Menjalankan App

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080/api/v1   # emulator
```

Lihat `docs/API_CLIENT.md` §1 untuk variasi base URL (device fisik, production).

### Menjalankan Test

```bash
flutter test
flutter test --coverage   # opsional, lihat coverage
```

## Branch Convention

Sama dengan backend (`../backend/CONTRIBUTING.md`), untuk konsistensi lintas repo:

- `main` — selalu buildable
- `feature/<domain>-<deskripsi-singkat>` — mis. `feature/waste-scan-camera`, `feature/chapter-quiz-flow`
- `fix/<deskripsi-singkat>` — untuk bug fix

## Commit Message Format

```
<type>: <description>

<optional body>
```

Types: `feat`, `fix`, `refactor`, `docs`, `test`, `chore`, `perf`.

Contoh: `feat: add waste scan matching logic and result screen`

## Alur Kerja Fitur

1. Baca `docs/PRD.md`, `docs/ARCHITECTURE.md`, `docs/API_CLIENT.md`, `docs/SCREENS.md` untuk modul terkait sebelum mulai — termasuk cross-check endpoint yang dipakai ke `../backend/docs/API_CONTRACT.md` (dokumen ini turunan, source of truth tetap di backend).
2. Untuk logic non-trivial (matching sampah↔tong, token refresh, daily-cap handling), tulis test dulu.
3. Sebelum anggap task selesai, cek semua item relevan di `docs/DEFINITION_OF_DONE.md`.
4. Update dokumen terkait (`docs/DATA_MODELS.md` jika bentuk response API aktual beda dari dugaan awal, `docs/PRD.md` decision log jika ada keputusan arsitektur baru) di commit yang sama.

## Solo Dev Notes

Tidak ada proses PR review formal (solo developer) — commit langsung ke `main` setelah self-check `docs/DEFINITION_OF_DONE.md` diperbolehkan, tapi tetap pertahankan commit history yang bermakna (bukan `wip`/`fix2`/`asdf`) supaya mudah ditelusuri kalau perlu debug/rollback mendekati deadline.
