import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Sumber: `GET/PATCH /profile/me` (`backend/internal/profile/service.go: Response`).
/// Bentuk response **tidak** sama dengan tabel `users` mentah — tidak ada
/// `is_verified`/`created_at` (tidak relevan untuk client setelah login),
/// `role` sengaja tidak dimodelkan (tidak ada UI admin di client).
@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String email,
    required String username,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'currency_balance') required int currencyBalance,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
