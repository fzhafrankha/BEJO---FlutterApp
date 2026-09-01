# Screens & Navigation — Frontend Flutter

Inventori layar, route `go_router`, endpoint yang dipakai, dan state yang wajib ditangani. Diturunkan dari fitur di `docs/PRD.md` §2 dan endpoint di `../backend/docs/API_CONTRACT.md`.

Konvensi state per screen (kecuali disebutkan lain): **loading** (skeleton/spinner saat fetch pertama), **empty** (data kosong tapi request sukses — bukan error), **error** (request gagal, tombol retry), **success** (data tampil normal).

## Route Map (go_router)

```
/splash                          -> cek token tersimpan -> redirect /auth/login atau /home
/auth/register
/auth/otp?email=...
/auth/login
/home                             (bottom nav: Home, Chapters, Shop, News, Profile)
/waste-scan                       (kamera, biasanya diakses dari FAB di /home)
/waste-scan/result                (hasil scan setelah submit)
/chapters                         (tab dalam /home atau route sendiri)
/chapters/:id
/chapters/:id/quiz
/quiz/happiness
/shop                             (tab: katalog | gacha | koleksiku)
/news                             (tab dalam /home)
/news/:id                         (detail/WebView ke url asli jika perlu)
/chatbot
/profile                          (tab dalam /home)
/profile/edit
```

Guard: semua route selain `/splash` dan `/auth/*` di-redirect ke `/auth/login` jika `AuthNotifier` state unauthenticated (lihat `docs/ARCHITECTURE.md` §6).

## 1. Splash (`/splash`)

- Cek token tersimpan di `SecureStorage`. Ada token valid → `GET /profile/me` untuk verifikasi token masih hidup → sukses ke `/home`, gagal (401 setelah refresh gagal) → `/auth/login`.
- Tidak ada token → langsung `/auth/login`.
- State: hanya loading singkat, tidak ada UI error kompleks di sini (kegagalan diarahkan ke login).

## 2. Auth Flow

### 2.1 Register (`/auth/register`)
- Form: email, username, password (min 8, alfanumerik — validasi client mengikuti aturan backend `docs/PRD.md`/`ARCHITECTURE.md` biar user tidak submit lalu gagal).
- Endpoint: `POST /auth/register` → sukses → panggil `POST /auth/send-otp` → navigate `/auth/otp?email=...`.
- Error state: `VALIDATION_ERROR` (email/username sudah dipakai — tampilkan inline di field terkait berdasarkan `error.message`).

### 2.2 OTP Verification (`/auth/otp`)
- Input kode OTP, tombol "Kirim ulang" (cooldown 60 detik — tampilkan countdown di UI, jangan andalkan hanya validasi server).
- Endpoint: `POST /auth/verify-otp` → sukses → navigate `/auth/login` (dengan pesan "akun terverifikasi, silakan login"). `POST /auth/send-otp` untuk resend.
- Error state: `INVALID_OTP`, `OTP_RETRY_EXCEEDED` (lihat mapping di `docs/API_CLIENT.md`).

### 2.3 Login (`/auth/login`)
- Form: email, password.
- Endpoint: `POST /auth/login` → simpan `AuthTokens` ke `SecureStorage` → sukses ke `/home`.
- Error state: `FORBIDDEN` (belum verified → tawarkan navigate ke `/auth/otp` lagi), kredensial salah (`VALIDATION_ERROR`/401 generik dari backend — sesuaikan begitu behavior pasti dikonfirmasi saat integrasi).

## 3. Home / Dashboard (`/home`)

- Tampilkan ringkasan: currency balance (`GET /profile/me`), state tamagotchi (`GET /tamagotchi/me`), shortcut ke waste scan.
- Bottom navigation ke Chapters, Shop, News, Profile (tab, bukan full route push, supaya state per tab persist).
- Loading: skeleton dashboard. Error: retry banner, tidak block seluruh screen jika hanya salah satu fetch gagal (mis. tamagotchi gagal load tapi profile sukses → tampilkan yang berhasil, retry hanya bagian yang gagal).

## 4. Tamagotchi (bagian dari `/home`, aksi terpisah)

- Aksi "Feed" (`POST /tamagotchi/me/feed`) → optimistic update happiness (opsional) atau tunggu response → refresh state.
- Aksi "Equip Accessory" (`POST /tamagotchi/me/equip`) — dipicu dari `/shop` tab "Koleksiku", bukan screen terpisah.

## 5. Waste Scan (`/waste-scan`, `/waste-scan/result`)

- `/waste-scan`: live camera view via `ultralytics_yolo` (`YoloView`). Overlay UI menampilkan status deteksi real-time (lihat `docs/ARCHITECTURE.md` §4): "arahkan ke sampah & tong" jika salah satu grup kelas belum terdeteksi.
- Saat user capture (atau otomatis saat kedua grup terdeteksi stabil beberapa frame — keputusan UX, bebas ditentukan saat implementasi): jalankan matching logic lokal → tampilkan preview hasil (benar/salah) **sebelum** submit ke backend, supaya user dapat feedback instan.
- Submit hasil ke `POST /waste-scan/submit` (dengan `Idempotency-Key`) → navigate `/waste-scan/result` menampilkan `currency_awarded`.
- Izin kamera: handle permission denied secara eksplisit (state terpisah dari loading/error biasa — arahkan ke app settings jika permanently denied).
- Error state tambahan spesifik: model gagal load (`assets/model/*.tflite` tidak ketemu/corrupt) — tampilkan error jelas, ini bug build bukan network error.

## 6. Chapters (`/chapters`, `/chapters/:id`, `/chapters/:id/quiz`)

- `/chapters`: list dari `GET /chapters`, tampilkan lock/unlock/completed status per item (item locked tidak bisa ditap masuk ke detail — cegah `CHAPTER_LOCKED` di level UI, bukan cuma tangani errornya).
- `/chapters/:id`: baca `ChapterContent` dari asset lokal `assets/chapters/chapter_<id>.json` (lihat `docs/ARCHITECTURE.md` §5) — **tidak** ada network call untuk konten ini, hanya loading asset lokal (praktis instant, tapi tetap handle kalau asset belum ada untuk id tsb → error state "materi belum tersedia").
- `/chapters/:id/quiz`: `GET /chapters/:id/quiz` ambil soal, `POST /chapters/:id/quiz/submit` per jawaban/per sesi (sesuaikan pola submit — sekali di akhir vs per soal — dengan behavior aktual endpoint saat integrasi). Tampilkan hasil reward (`reward_currency`, `chapterUnlockedNext`) jika ada.
- Error state: `DAILY_CAP_REACHED` (lihat `docs/API_CLIENT.md`).

## 7. Quiz Happiness (`/quiz/happiness`)

- `GET /quiz/happiness` ambil soal, submit tiap jawaban ke `POST /quiz/happiness/submit`. Tampilkan efek ke happiness tamagotchi setelah selesai (redirect balik ke `/home` atau tampilkan ringkasan sesi).
- Error state: `DAILY_CAP_REACHED`.

## 8. Shop (`/shop`)

Tiga sub-tab dalam satu screen:
- **Katalog**: `GET /shop/accessories` + tombol beli → `POST /shop/accessories/:id/purchase` (dengan `Idempotency-Key`). Error: `INSUFFICIENT_CURRENCY`.
- **Gacha**: `POST /shop/gacha/pull` (dengan `Idempotency-Key`) → tampilkan animasi/reveal hasil (`GachaResult`). Error: `INSUFFICIENT_CURRENCY`.
- **Koleksiku**: `GET /shop/my-accessories` — list aksesoris dimiliki, tombol "Pasang" memanggil `POST /tamagotchi/me/equip`.

## 9. News (`/news`, `/news/:id`)

- `/news`: `GET /news` paginated (infinite scroll atau pagination manual — keputusan UX bebas, konsisten dengan pola loading pagination di `docs/API_CLIENT.md` §2).
- `/news/:id`: buka `url` asli (external browser via `url_launcher`, atau in-app `WebView` — pilih `url_launcher` dulu untuk kesederhanaan, cukup untuk MVP).
- Empty state: "Belum ada berita hari ini" jika `news_cache` kosong (bisa terjadi kalau job scheduler backend belum jalan/`GNEWS_API_KEY` kosong — bukan error, tangani sebagai empty state).

## 10. Chatbot (`/chatbot`)

- Mulai sesi (`POST /chatbot/sessions`) saat pertama masuk screen (atau lanjutkan sesi terakhir — keputusan UX, MVP: selalu sesi baru per kali masuk screen untuk kesederhanaan).
- Kirim pesan (`POST /chatbot/sessions/:id/messages`), load history (`GET /chatbot/sessions/:id/messages`).
- `PROMPT_GUARD_BLOCKED` ditampilkan sebagai balasan chatbot (lihat mapping di `docs/API_CLIENT.md`), bukan error dialog yang mengganggu flow chat.
- Loading state: indikator "sedang mengetik..." selama menunggu balasan (request LLM bisa beberapa detik, timeout 30s di backend — beri feedback visual, jangan biarkan UI terlihat freeze).

## 11. Profile (`/profile`, `/profile/edit`)

- `/profile`: `GET /profile/me` — tampilkan username, email, avatar, currency balance, tombol logout.
- `/profile/edit`: `PATCH /profile/me` (update username dll), upload avatar (`POST /profile/me/avatar`, lihat `docs/API_CLIENT.md` §5).
- Logout: `POST /auth/logout` → clear `SecureStorage` → redirect `/auth/login`. Tetap clear storage lokal meski request logout gagal (network error) — jangan biarkan user terjebak tidak bisa logout karena tidak ada koneksi.
