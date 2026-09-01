import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String email,
    required String password,
    required String username,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

/// Response `POST /auth/register` — bentuk beda dari `User` (tidak ada avatar/currency,
/// lihat `backend/internal/auth/model.go: UserResponse`).
@freezed
abstract class RegisterResult with _$RegisterResult {
  const factory RegisterResult({
    required int id,
    required String email,
    required String username,
    @JsonKey(name: 'is_verified') required bool isVerified,
  }) = _RegisterResult;

  factory RegisterResult.fromJson(Map<String, dynamic> json) => _$RegisterResultFromJson(json);
}

/// Response `POST /auth/login` & `POST /auth/refresh` (`TokenPair`) — tidak berisi data user.
@freezed
abstract class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'expires_in') required int expiresIn,
  }) = _AuthTokens;

  factory AuthTokens.fromJson(Map<String, dynamic> json) => _$AuthTokensFromJson(json);
}
