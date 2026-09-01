# Tasks — Frontend Flutter (Solo Developer)

Breakdown sprint untuk **1 orang developer**. Deadline kompetisi ANFORCOM2026: <1 bulan dari 2026-08-27 (mengikuti `../backend/docs/PRD.md`). Backend & model sudah tersedia (lihat `../backend/` dan `../model/`), jadi frontend bisa langsung integrasi tanpa menunggu — namun tetap verifikasi bentuk response aktual saat implementasi tiap modul (beberapa field response di `docs/DATA_MODELS.md` masih ditandai perlu konfirmasi).

Urutan sprint dirancang linear: tiap sprint membangun di atas sprint sebelumnya (auth dulu karena semua endpoint lain butuh token; waste scan+tamagotchi dulu sebagai "core loop" sebelum fitur pelengkap).

## Sprint 0 — Scaffold & Fondasi

- [ ] Init project Flutter, setup `flutter_lints`, struktur folder sesuai `docs/ARCHITECTURE.md` §2.
- [ ] Setup `core/network/api_client.dart` (dio) + envelope parsing interceptor.
- [ ] Setup `core/storage/secure_storage.dart` (flutter_secure_storage wrapper).
- [ ] Setup `core/router/app_router.dart` (go_router, route map dasar dari `docs/SCREENS.md`, guard auth kosong dulu).
- [ ] Setup codegen (`build_runner`, `freezed`, `json_serializable`) — pastikan `flutter pub run build_runner build` jalan bersih di awal.
- [ ] Setup `flutter_lints` + CI dasar (opsional untuk solo dev — lihat `../CONTRIBUTING.md`).

## Sprint 1 — Auth & Networking Core

- [ ] Model `User`, `AuthTokens`, `RegisterRequest`, `LoginRequest` (`docs/DATA_MODELS.md`).
- [ ] `AuthRepository` (register, send-otp, verify-otp, login, refresh, logout).
- [ ] `AuthNotifier` (state: unauthenticated / otpPending / authenticated) + auto-refresh interceptor (`docs/ARCHITECTURE.md` §3.2) — **prioritas tinggi**, semua fitur lain bergantung pada ini.
- [ ] Screen: Splash, Register, OTP, Login (`docs/SCREENS.md` §1-2).
- [ ] Idempotency-Key helper (`core/network/idempotency.dart`) — dipakai sprint berikutnya.
- [ ] Test: auth flow (unit AuthNotifier + widget test login/OTP screen), token refresh logic.

## Sprint 2 — Core Loop: Tamagotchi & Waste Scan

- [ ] Model `Tamagotchi`, `Accessory` (embedded), `WasteScanResult` (`docs/DATA_MODELS.md`).
- [ ] `TamagotchiRepository` (get, feed, equip), `WasteScanRepository` (submit).
- [ ] Integrasi `ultralytics_yolo`: load model dari `assets/model/`, live camera view, matching logic sampah↔tong (`docs/ARCHITECTURE.md` §4) — **test di device fisik sesegera mungkin**, jangan tunda ke akhir (risiko performa/akurasi paling tinggi ada di sini).
- [ ] Screen: Home/Dashboard dasar (tamagotchi state saja dulu), Waste Scan + Waste Scan Result (`docs/SCREENS.md` §3-5).
- [ ] Test: matching logic (unit, tanpa perlu device — pure function), WasteScanRepository dengan Idempotency-Key (mock).

## Sprint 3 — Modul 3R (Chapters) & Quiz

- [ ] Model `Chapter`, `ChapterContent`, `QuizQuestion`, `HappinessQuizResult`, `ChapterQuizResult` (`docs/DATA_MODELS.md`).
- [ ] Siapkan minimal 2-3 asset `assets/chapters/chapter_<id>.json` (konten materi — bisa placeholder dulu, prioritas struktur benar).
- [ ] `ChapterRepository` (list, quiz per chapter, submit), `QuizHappinessRepository`.
- [ ] Screen: Chapters list, Chapter detail (baca asset lokal), Chapter quiz, Quiz Happiness (`docs/SCREENS.md` §6-7).
- [ ] Test: daily-cap error handling, chapter locked prevention di UI level.

## Sprint 4 — Shop, Gacha, News, Chatbot

- [ ] Model `UserAccessory`, `GachaResult`, `NewsItem`, `ChatSession`, `ChatMessage` (`docs/DATA_MODELS.md`).
- [ ] `ShopRepository` (katalog, purchase, gacha, my-accessories), `NewsRepository`, `ChatbotRepository`.
- [ ] Screen: Shop (3 sub-tab), News list+detail, Chatbot (`docs/SCREENS.md` §8-10).
- [ ] Test: insufficient-currency handling, prompt-guard-blocked ditampilkan sebagai balasan chat (bukan error dialog).

## Sprint 5 — Profile, Polish, Testing Device Fisik, Demo Prep

- [ ] Model auth/profile edit lengkap, Screen Profile + Edit Profile + avatar upload (`docs/SCREENS.md` §11).
- [ ] Dashboard Home final (gabungkan semua ringkasan: currency, tamagotchi, shortcut).
- [ ] Full pass semua checklist `docs/DEFINITION_OF_DONE.md`.
- [ ] **Test end-to-end di device fisik Android** (bukan cuma emulator) — wajib khusus untuk waste scan (`best_int8.tflite` vs `best_float32.tflite`, lihat `../model/docs/INTEGRATION.md` §Checklist).
- [ ] Buffer bug fix + persiapan demo (skenario demo end-to-end: register→scan sampah→dapat koin→beli aksesoris→pasang ke tamagotchi).

## Backlog / Tech Debt (di luar scope MVP, dicatat untuk transparansi)

- Mode offline untuk fitur selain materi chapter.
- Versioning konten chapter tanpa perlu rebuild app.
- Multi-platform (iOS/web/desktop) — MVP Android-only.
- WebView in-app untuk detail berita (MVP pakai `url_launcher` ke browser eksternal).
