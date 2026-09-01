# API Client — Referensi Konsumsi API dari Flutter

Dokumen ini **bukan** pengganti `../backend/docs/API_CONTRACT.md` — untuk detail lengkap tiap endpoint (method, path, body, auth requirement) selalu rujuk ke sana. Dokumen ini hanya fokus ke hal spesifik sisi client: konfigurasi, mapping error, dan strategi retry.

## 1. Base URL & Environment

Tiga environment: `development` (backend lokal via `docker compose` / `go run`), `staging` (kalau ada), `production` (VPS lewat Cloudflare Tunnel, lihat `../backend/docs/ARCHITECTURE.md` §11).

Pakai `--dart-define` (bukan file `.env` bundled ke APK — hindari base URL production ter-hardcode di source control):

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080/api/v1   # emulator Android -> localhost host
flutter run --dart-define=API_BASE_URL=http://<ip-lan-device>:8080/api/v1  # device fisik, satu jaringan wifi
flutter build apk --dart-define=API_BASE_URL=https://api.production-domain.com/api/v1
```

`core/network/api_client.dart` baca lewat `String.fromEnvironment('API_BASE_URL', defaultValue: 'http://10.0.2.2:8080/api/v1')` — default aman untuk emulator saat lupa pass flag.

> Catatan: `10.0.2.2` adalah alias host machine dari Android **emulator**. Untuk device fisik, pakai IP LAN komputer development (`ipconfig`/`ifconfig`), dan pastikan backend `APP_PORT` accessible di jaringan yang sama (bukan `localhost`-only bind).

## 2. Pagination

Endpoint list (`GET /news`, dll — lihat `../backend/docs/API_CONTRACT.md` mana saja yang paginated) pakai query `?page=1&limit=20` (`limit` max 50, di-clamp server). Response menyertakan `meta: { total, page, limit }`. Repository expose method dengan parameter `page`/`limit` eksplisit — Notifier di application layer yang mengelola state "load more"/infinite scroll, bukan repository.

## 3. Mapping Error Code → Pesan UI

`ApiException.code` (lihat `docs/DATA_MODELS.md` §Error Model) di-mapping ke pesan Bahasa Indonesia yang actionable, di satu tempat terpusat (`core/network/error_messages.dart`) supaya tidak duplikat string di tiap screen:

| Code | HTTP | Pesan UI (contoh) | Aksi UI yang disarankan |
|---|---|---|---|
| `VALIDATION_ERROR` | 400 | Tampilkan `error.message` dari server apa adanya (biasanya sudah field-level) | Highlight field form yang salah |
| `UNAUTHORIZED` | 401 | (tidak ditampilkan ke user — ditangani auto-refresh interceptor, lihat `docs/ARCHITECTURE.md` §3.2) | Refresh token / redirect login jika refresh gagal |
| `FORBIDDEN` | 403 | "Akun belum terverifikasi" (khusus login) / "Akses ditolak" | Redirect ke flow verifikasi OTP jika konteks login |
| `NOT_FOUND` | 404 | "Data tidak ditemukan" | Kembali ke layar sebelumnya |
| `INVALID_OTP` | 400 | "Kode OTP salah atau sudah kedaluwarsa" | Fokus ke input OTP, tawarkan kirim ulang |
| `OTP_RETRY_EXCEEDED` | 429 | "Terlalu banyak percobaan. Coba lagi nanti atau kirim ulang kode." | Disable tombol verifikasi sementara |
| `DAILY_CAP_REACHED` | 429 | "Kamu sudah mencapai batas quiz hari ini. Coba lagi besok!" | Disable tombol mulai quiz, jangan retry otomatis |
| `INSUFFICIENT_CURRENCY` | 400 | "Koinmu tidak cukup untuk ini" | Tampilkan saldo saat ini, arahkan ke cara dapat koin (scan sampah) |
| `CHAPTER_LOCKED` | 403 | "Chapter ini belum terbuka" | Jangan biarkan user masuk screen ini — idealnya dicegah dari UI list chapter, error ini sebagai safety net |
| `PROMPT_GUARD_BLOCKED` | 422 | "Maaf, aku cuma bisa bantu soal topik 3R ya!" | Tampilkan sebagai balasan chatbot, bukan error dialog — biar terasa natural |
| `RATE_LIMITED` | 429 | "Terlalu banyak percobaan, coba lagi sebentar lagi" | Disable aksi sementara (beberapa detik) |
| `INTERNAL_ERROR` | 500 | "Terjadi kesalahan, coba lagi" | Tombol retry generik |
| (network error, bukan dari server) | - | "Tidak ada koneksi internet" | Tombol retry, cek `connectivity_plus` jika ingin deteksi proaktif |

`REWARD_ALREADY_CLAIMED` sengaja tidak dipakai (reserved, submit chapter idempotent by design — lihat `API_CONTRACT.md`), tidak perlu ditangani di client.

## 4. Retry & Backoff

- **Network error** (timeout, no connection — `DioExceptionType.connectionTimeout`/`connectionError`): tampilkan state error dengan tombol "Coba lagi" manual. **Tidak** retry otomatis tanpa aksi user, kecuali untuk refresh token (§Auth Interceptor di `docs/ARCHITECTURE.md`).
- **401 karena access token expired**: retry otomatis 1x setelah refresh sukses (lihat `docs/ARCHITECTURE.md` §3.2) — transparan ke user, bukan tombol manual.
- **429 (`RATE_LIMITED`, `DAILY_CAP_REACHED`, `OTP_RETRY_EXCEEDED`)**: **tidak** retry otomatis — ini sinyal "berhenti", bukan transient error. Tampilkan pesan dan disable aksi terkait.
- **5xx (`INTERNAL_ERROR`)**: tombol retry manual, tidak ada retry otomatis (untuk hindari membebani server yang sedang bermasalah).
- Operasi yang butuh `Idempotency-Key` (§3.3 `docs/ARCHITECTURE.md`) **aman** di-retry dengan key yang sama kapan pun user menekan "coba lagi" untuk request yang sama.

## 5. Multipart Upload (Avatar)

`POST /profile/me/avatar` — validasi di client **sebelum** kirim (max 5MB, JPG/PNG/WebP saja) untuk hemat kuota data user dan hindari round-trip sia-sia, tapi backend tetap validasi ulang (jangan andalkan validasi client sebagai satu-satunya lapis, lihat `../backend/docs/DEFINITION_OF_DONE.md` §Security). Pakai `image_picker` untuk ambil file + cek `File.lengthSync()` dan ekstensi sebelum construct `FormData` dio.

## 6. Health Check (Development)

`GET /healthz` (tanpa auth) — berguna untuk cek konektivitas ke backend saat development/debugging jaringan (mis. splash screen bisa ping ini dulu sebelum coba auth flow, opsional, bukan wajib untuk MVP).
