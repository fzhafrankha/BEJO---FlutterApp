import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../../../shared/models/user.dart';
import '../../profile/data/profile_repository.dart';
import '../data/auth_models.dart';
import '../data/auth_repository.dart';

part 'auth_notifier.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  /// Splash — belum tahu ada sesi tersimpan atau tidak.
  const factory AuthState.unknown() = _Unknown;
  const factory AuthState.unauthenticated({String? message}) = _Unauthenticated;
  const factory AuthState.otpPending({required String email}) = _OtpPending;
  const factory AuthState.authenticated({required User user}) = _Authenticated;
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

/// Root guard untuk `go_router redirect` (`docs/ARCHITECTURE.md` §6) — semua
/// route selain `/auth/*` redirect ke login jika state `unauthenticated`.
class AuthNotifier extends Notifier<AuthState> {
  late final AuthRepository _authRepo;
  late final ProfileRepository _profileRepo;

  @override
  AuthState build() {
    _authRepo = ref.watch(authRepositoryProvider);
    _profileRepo = ref.watch(profileRepositoryProvider);

    final interceptor = ref.watch(authInterceptorFromDioProvider);
    final sub = interceptor.onLoggedOut.listen((_) {
      state = const AuthState.unauthenticated(message: 'Sesi berakhir, silakan masuk ulang');
    });
    ref.onDispose(sub.cancel);

    _restoreSession();
    return const AuthState.unknown();
  }

  Future<void> _restoreSession() async {
    if (!await _authRepo.hasSession()) {
      state = const AuthState.unauthenticated();
      return;
    }
    try {
      final user = await _profileRepo.getMe();
      state = AuthState.authenticated(user: user);
    } catch (_) {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    await _authRepo.register(RegisterRequest(email: email, password: password, username: username));
    await _authRepo.sendOtp(email);
    state = AuthState.otpPending(email: email);
  }

  Future<void> resendOtp(String email) => _authRepo.sendOtp(email);

  Future<void> verifyOtp({required String email, required String code}) async {
    await _authRepo.verifyOtp(email, code);
    state = const AuthState.unauthenticated(message: 'Akun terverifikasi, silakan masuk');
  }

  /// Kalau login gagal karena akun belum diverifikasi (`FORBIDDEN`), kirim OTP
  /// baru dan pindah ke `otpPending` supaya user tidak buntu di layar login.
  Future<void> login({required String email, required String password}) async {
    try {
      await _authRepo.login(LoginRequest(email: email, password: password));
      final user = await _profileRepo.getMe();
      state = AuthState.authenticated(user: user);
    } on ApiException catch (e) {
      if (e.code == 'FORBIDDEN') {
        await _authRepo.sendOtp(email);
        state = AuthState.otpPending(email: email);
      }
      rethrow;
    }
  }

  Future<void> logout() async {
    await _authRepo.logout();
    state = const AuthState.unauthenticated();
  }

  Future<void> refreshUser() async {
    if (state is! _Authenticated) return;
    final user = await _profileRepo.getMe();
    state = AuthState.authenticated(user: user);
  }
}
