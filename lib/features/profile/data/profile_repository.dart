import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../../shared/models/user.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(apiClientProvider));
});

class ProfileRepository {
  final ApiClient apiClient;
  ProfileRepository(this.apiClient);

  Future<User> getMe() async {
    final res = await apiClient.get('/profile/me');
    return User.fromJson(res.data as Map<String, dynamic>);
  }

  Future<User> updateUsername(String username) async {
    final res = await apiClient.patch('/profile/me', data: {'username': username});
    return User.fromJson(res.data as Map<String, dynamic>);
  }

  /// Validasi tipe/ukuran dilakukan di client SEBELUM memanggil ini
  /// (`docs/DEFINITION_OF_DONE.md`: 5MB, JPG/PNG/WebP) — backend juga
  /// memvalidasi ulang (`pkg/fileupload`), ini cuma UX cepat.
  Future<User> uploadAvatar(String filePath) async {
    final formData = FormData.fromMap({'avatar': await MultipartFile.fromFile(filePath)});
    final res = await apiClient.post('/profile/me/avatar', data: formData);
    return User.fromJson(res.data as Map<String, dynamic>);
  }
}
