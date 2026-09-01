# Plan — Build Full MVP Flutter APK (Standalone Mock)

**Status**: Disetujui (hasil wawancara 2026-08-29)
**Target**: Full MVP Flutter APK untuk ANFORCOM2026, standalone tanpa backend.

## 1. Scope Terkunci (hasil wawancara)

- **Output**: full MVP Flutter APK — semua screen di `docs/SCREENS.md`.
- **Waste scan**: dibangun dengan **mock detection + seam** (interface `Detector`), model `.tflite` di-drop belakangan setelah training.
- **Data**: **mock API / fake repository** — app tidak bergantung backend (backend kode sudah ada, tapi belum deploy).
- **Skip**: testing, infra/deploy, git, training model.

## 2. Temuan Environment (prasyarat sebelum build APK)

Flutter 3.47.0 + Java 21 ada, Android SDK ada di `~/Android/Sdk` (v36). Masalah:

- `cmdline-tools` **missing** → `sdkmanager` tidak ada, license belum diterima.
- `ANDROID_HOME` / `ANDROID_SDK_ROOT` **tidak diset**.

Akibatnya `flutter build apk` belum jalan sampai prasyarat di Phase 0 terpenuhi.

## 3. Keputusan Arsitektur

1. **Nama**: package Dart `tamagotchi_app`, applicationId `com.anforcom2026.tamagotchi`. Folder project = `frontend/` (pakai `flutter create --project-name tamagotchi_app .`).
2. **Mekanisme mock↔real**: setiap repository = **interface** + 2 impl (`HttpXxxRepository` / `MockXxxRepository`), dipilih lewat `bool.fromEnvironment('USE_MOCK_API', defaultValue: true)` di provider factory. Default `true` → flip ke `false` saat backend live **tanpa ubah kode feature**.
3. **Deteksi waste scan**: `Detector` interface → `MockDetector` (deteksi deterministik/dummy) sekarang; `ultralytics_yolo` **belum** ditambahkan ke dependency sampai model siap. Matching logic `sampah↔tong` = **pure function** (mudah dites nanti).
4. **Token storage**: `TokenStorage` interface → `flutter_secure_storage` (jalan di Android), fallback in-memory di mock mode.
5. **Konten chapter**: bundled sebagai asset lokal `assets/chapters/chapter_<id>.json` (sesuai `docs/ARCHITECTURE.md` §5).

## 4. Rencana Eksekusi

### Phase 0 — Prasyarat build
- [ ] Install Android `cmdline-tools`.
- [ ] `flutter doctor --android-licenses` (accept license).
- [ ] Set `ANDROID_HOME` / `flutter config --android-sdk`.
- [ ] Verifikasi `flutter doctor` hijau untuk Android toolchain.

### Phase 1 — Scaffold & fondasi
- [ ] `flutter create --project-name tamagotchi_app .`
- [ ] `pubspec.yaml`: tambah `flutter_riverpod`, `go_router`, `dio`, `freezed_annotation` + `build_runner`/`freezed`/`json_serializable`, `flutter_secure_storage`, `uuid`, `image_picker`, `url_launcher`.
- [ ] Struktur folder `lib/core`, `lib/features/<domain>/{presentation,application,data}`, `lib/shared`, `assets/chapters`.
- [ ] `core/network/api_client.dart` (dio + envelope interceptor), `api_exception.dart`, `error_messages.dart`.
- [ ] `core/storage/secure_storage.dart`, `core/router/app_router.dart` (go_router + auth guard).
- [ ] `flutter pub run build_runner build` bersih di awal.

### Phase 2 — Auth (mock)
- [ ] Model `User`, `AuthTokens`, `RegisterRequest`, `LoginRequest` (`docs/DATA_MODELS.md`).
- [ ] `AuthRepository` interface + `MockAuthRepository`; `AuthNotifier` (unauthenticated/otpPending/authenticated).
- [ ] Screen: Splash, Register, OTP (cooldown 60s), Login.

### Phase 3 — Home + Tamagotchi
- [ ] Model `Tamagotchi`, `Accessory`; `TamagotchiRepository` (mock: feed +happiness, equip).
- [ ] Home dashboard + bottom nav (Home/Chapters/Shop/News/Profile).

### Phase 4 — Waste Scan (mock + seam)
- [ ] `features/waste_scan/ml/` → `Detector` interface + `MockDetector` + `matching_logic.dart` (pure).
- [ ] Screen `/waste-scan` (preview kamera mock) + `/waste-scan/result`; `WasteScanRepository` (mock submit, balikin `currency_awarded`).
- [ ] Handle state "arahkan ke sampah & tong" saat salah satu grup tak terdeteksi.

### Phase 5 — Chapters & Quiz
- [ ] Model `Chapter`, `ChapterContent`, `QuizQuestion`, `QuizSubmitResult`.
- [ ] Asset `assets/chapters/chapter_<id>.json` (2–3 chapter).
- [ ] `ChapterRepository` + `QuizHappinessRepository` (mock); screen: list, detail (asset lokal), quiz chapter, quiz happiness.
- [ ] Handle `DAILY_CAP_REACHED`, `CHAPTER_LOCKED` di UI.

### Phase 6 — Shop, Gacha, News, Chatbot
- [ ] Model `UserAccessory`, `GachaResult`, `NewsItem`, `ChatSession`/`ChatMessage`.
- [ ] `ShopRepository`, `NewsRepository`, `ChatbotRepository` (mock).
- [ ] Screen: Shop (katalog/gacha/koleksiku), News list+detail (`url_launcher`), Chatbot (handle `PROMPT_GUARD_BLOCKED` sebagai balasan, bukan dialog).

### Phase 7 — Profile & polish
- [ ] Profile/edit, avatar upload (mock, `image_picker` + validasi 5MB/JPG-PNG-WebP), logout.
- [ ] Final pass: setiap screen punya loading/error/empty state; semua error code dipetakan ke pesan Bahasa Indonesia.

### Phase 8 — Build APK
- [ ] `flutter build apk --release --dart-define=USE_MOCK_API=true`.
- [ ] Uji di emulator/device fisik.

## 5. Catatan Risiko & Tradeoff

- **Skip testing**: matching logic + auth token flow dibuat pure/terisolasi supaya mudah dites nanti. Opsional: test tipis untuk 2–3 logic kritis tanpa menahan pace.
- **Mock API**: angka/behavior (currency, unlock, reward) adalah simulasi. Saat backend live, cukup flip `USE_MOCK_API=false` + real repository — kontrak sudah mengikuti `API_CONTRACT.md`.
- **Model belum ada**: waste scan di APK ini demonstratif (deteksi palsu), fungsionalitas asli menunggu training model.
