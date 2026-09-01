import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../core/storage/secure_storage.dart';
import 'auth_models.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    apiClient: ref.watch(apiClientProvider),
    storage: ref.watch(secureStorageProvider),
  );
});

/// Satu-satunya lapisan yang bicara ke `ApiClient` untuk domain auth
/// (`docs/ARCHITECTURE.md` §1). Menyimpan token ke [SecureStorage] setelah
/// login sukses — pemanggil (notifier) tidak perlu tahu detail storage.
class AuthRepository {
  final ApiClient apiClient;
  final SecureStorage storage;

  AuthRepository({required this.apiClient, required this.storage});

  Future<RegisterResult> register(RegisterRequest request) async {
    final res = await apiClient.post('/auth/register', data: request.toJson());
    return RegisterResult.fromJson(res.data as Map<String, dynamic>);
  }

  Future<void> sendOtp(String email) async {
    await apiClient.post('/auth/send-otp', data: {'email': email});
  }

  Future<void> verifyOtp(String email, String code) async {
    await apiClient.post('/auth/verify-otp', data: {'email': email, 'code': code});
  }

  Future<AuthTokens> login(LoginRequest request) async {
    final res = await apiClient.post('/auth/login', data: request.toJson());
    final tokens = AuthTokens.fromJson(res.data as Map<String, dynamic>);
    await storage.saveTokens(accessToken: tokens.accessToken, refreshToken: tokens.refreshToken);
    return tokens;
  }

  /// Clear storage lokal selalu dijalankan walau request `/auth/logout` gagal
  /// (mis. network error) — user tidak boleh terjebak "tidak bisa logout".
  Future<void> logout() async {
    final refreshToken = await storage.readRefreshToken();
    if (refreshToken != null) {
      try {
        await apiClient.post('/auth/logout', data: {'refresh_token': refreshToken});
      } catch (_) {
        // sengaja diabaikan, lihat dokumentasi method di atas.
      }
    }
    await storage.clear();
  }

  Future<bool> hasSession() async => (await storage.readAccessToken()) != null;
}
