import 'api_exception.dart';

/// Mapping `ApiException.code` -> pesan UI Bahasa Indonesia terpusat
/// (`docs/API_CLIENT.md` §3) — supaya string tidak duplikat di tiap screen.
String errorMessageFor(ApiException e) {
  switch (e.code) {
    case 'VALIDATION_ERROR':
      return e.message;
    case 'FORBIDDEN':
      return 'Akun belum terverifikasi';
    case 'NOT_FOUND':
      return 'Data tidak ditemukan';
    case 'INVALID_OTP':
      return 'Kode OTP salah atau sudah kedaluwarsa';
    case 'OTP_RETRY_EXCEEDED':
      return 'Terlalu banyak percobaan. Coba lagi nanti atau kirim ulang kode.';
    case 'DAILY_CAP_REACHED':
      return 'Kamu sudah mencapai batas quiz hari ini. Coba lagi besok!';
    case 'INSUFFICIENT_CURRENCY':
      return 'Koinmu tidak cukup untuk ini';
    case 'CHAPTER_LOCKED':
      return 'Chapter ini belum terbuka';
    case 'PROMPT_GUARD_BLOCKED':
      return 'Maaf, aku cuma bisa bantu soal topik 3R ya!';
    case 'RATE_LIMITED':
      return 'Terlalu banyak percobaan, coba lagi sebentar lagi';
    case 'UNAUTHORIZED':
      return 'Email atau kata sandi salah';
    case 'NETWORK_ERROR':
      return 'Tidak ada koneksi internet';
    case 'INTERNAL_ERROR':
      return 'Terjadi kesalahan, coba lagi';
    default:
      return e.message.isNotEmpty ? e.message : 'Terjadi kesalahan, coba lagi';
  }
}
