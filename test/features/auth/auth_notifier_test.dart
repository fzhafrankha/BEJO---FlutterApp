import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tamagotchi_app/core/network/api_client.dart';
import 'package:tamagotchi_app/core/network/api_exception.dart';
import 'package:tamagotchi_app/core/network/auth_interceptor.dart';
import 'package:tamagotchi_app/core/storage/secure_storage.dart';
import 'package:tamagotchi_app/features/auth/application/auth_notifier.dart';
import 'package:tamagotchi_app/features/auth/data/auth_models.dart';
import 'package:tamagotchi_app/features/auth/data/auth_repository.dart';
import 'package:tamagotchi_app/features/profile/data/profile_repository.dart';
import 'package:tamagotchi_app/shared/models/user.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockProfileRepository extends Mock implements ProfileRepository {}

class MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late MockAuthRepository authRepo;
  late MockProfileRepository profileRepo;
  late ProviderContainer container;

  setUpAll(() {
    registerFallbackValue(const RegisterRequest(email: '', password: '', username: ''));
    registerFallbackValue(const LoginRequest(email: '', password: ''));
  });

  setUp(() {
    authRepo = MockAuthRepository();
    profileRepo = MockProfileRepository();
    when(() => authRepo.hasSession()).thenAnswer((_) async => false);

    final fakeInterceptor = AuthInterceptor(storage: MockSecureStorage(), dio: Dio());

    container = ProviderContainer(overrides: [
      authRepositoryProvider.overrideWithValue(authRepo),
      profileRepositoryProvider.overrideWithValue(profileRepo),
      authInterceptorFromDioProvider.overrideWithValue(fakeInterceptor),
    ]);
    addTearDown(container.dispose);
  });

  test('state awal unknown lalu resolve ke unauthenticated saat tidak ada sesi', () async {
    expect(container.read(authNotifierProvider), const AuthState.unknown());
    await Future<void>.delayed(Duration.zero);
    expect(container.read(authNotifierProvider), const AuthState.unauthenticated());
  });

  test('register sukses -> otpPending', () async {
    when(() => authRepo.register(any())).thenAnswer(
      (_) async => const RegisterResult(id: 1, email: 'a@a.com', username: 'a', isVerified: false),
    );
    when(() => authRepo.sendOtp(any())).thenAnswer((_) async {});

    final notifier = container.read(authNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);
    await notifier.register(email: 'a@a.com', password: 'password123', username: 'a');

    expect(container.read(authNotifierProvider), const AuthState.otpPending(email: 'a@a.com'));
    verify(() => authRepo.sendOtp('a@a.com')).called(1);
  });

  test('login sukses -> hydrate user dari profile lalu authenticated', () async {
    when(() => authRepo.login(any())).thenAnswer(
      (_) async => const AuthTokens(
        accessToken: 'access',
        refreshToken: 'refresh',
        tokenType: 'Bearer',
        expiresIn: 900,
      ),
    );
    when(() => profileRepo.getMe()).thenAnswer(
      (_) async => const User(id: 1, email: 'a@a.com', username: 'budi', avatarUrl: '', currencyBalance: 50),
    );

    final notifier = container.read(authNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);
    await notifier.login(email: 'a@a.com', password: 'password123');

    final state = container.read(authNotifierProvider);
    state.maybeWhen(
      authenticated: (user) {
        expect(user.username, 'budi');
        expect(user.currencyBalance, 50);
      },
      orElse: () => fail('expected authenticated, got $state'),
    );
  });

  test('login FORBIDDEN (belum verifikasi) -> kirim ulang OTP dan pindah ke otpPending', () async {
    when(() => authRepo.login(any())).thenThrow(ApiException('FORBIDDEN', 'Akun belum diverifikasi'));
    when(() => authRepo.sendOtp(any())).thenAnswer((_) async {});

    final notifier = container.read(authNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);

    await expectLater(
      () => notifier.login(email: 'a@a.com', password: 'password123'),
      throwsA(isA<ApiException>()),
    );

    expect(container.read(authNotifierProvider), const AuthState.otpPending(email: 'a@a.com'));
    verify(() => authRepo.sendOtp('a@a.com')).called(1);
  });

  test('login credential salah (UNAUTHORIZED) -> tetap unauthenticated, tidak kirim OTP', () async {
    when(() => authRepo.login(any())).thenThrow(ApiException('UNAUTHORIZED', 'Email atau kata sandi salah'));

    final notifier = container.read(authNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);

    await expectLater(
      () => notifier.login(email: 'a@a.com', password: 'salah'),
      throwsA(isA<ApiException>()),
    );

    expect(container.read(authNotifierProvider), const AuthState.unauthenticated());
    verifyNever(() => authRepo.sendOtp(any()));
  });

  test('verifyOtp sukses -> unauthenticated dengan pesan sukses', () async {
    when(() => authRepo.verifyOtp(any(), any())).thenAnswer((_) async {});

    final notifier = container.read(authNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);
    await notifier.verifyOtp(email: 'a@a.com', code: '123456');

    final state = container.read(authNotifierProvider);
    state.maybeWhen(
      unauthenticated: (message) => expect(message, isNotNull),
      orElse: () => fail('expected unauthenticated, got $state'),
    );
  });

  test('logout -> state kembali unauthenticated', () async {
    when(() => authRepo.login(any())).thenAnswer(
      (_) async => const AuthTokens(
        accessToken: 'access',
        refreshToken: 'refresh',
        tokenType: 'Bearer',
        expiresIn: 900,
      ),
    );
    when(() => profileRepo.getMe()).thenAnswer(
      (_) async => const User(id: 1, email: 'a@a.com', username: 'budi', avatarUrl: '', currencyBalance: 0),
    );
    when(() => authRepo.logout()).thenAnswer((_) async {});

    final notifier = container.read(authNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);
    await notifier.login(email: 'a@a.com', password: 'password123');
    await notifier.logout();

    expect(container.read(authNotifierProvider), const AuthState.unauthenticated());
    verify(() => authRepo.logout()).called(1);
  });
}
