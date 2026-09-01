import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/secure_storage.dart';
import 'api_exception.dart';
import 'auth_interceptor.dart';

/// Base URL default untuk emulator Android (`10.0.2.2` = alias host machine).
/// Override lewat `flutter run --dart-define=API_BASE_URL=http://<lan-ip>:8080/api/v1`
/// (dibutuhkan saat testing di device fisik, lihat `docs/DEFINITION_OF_DONE.md`).
const apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://10.0.2.2:8080/api/v1',
);

/// Beberapa endpoint (mis. `shop/accessories.image_url`) mengembalikan path
/// relatif (`/uploads/...`), bukan URL absolut seperti didokumentasikan —
/// helper ini menyatukan keduanya jadi URL yang bisa langsung dipakai `Image.network`.
String resolveMediaUrl(String path) {
  if (path.isEmpty) return path;
  if (path.startsWith('http://') || path.startsWith('https://')) return path;
  final uri = Uri.parse(apiBaseUrl);
  return '${uri.scheme}://${uri.authority}$path';
}

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: 'application/json',
    ),
  );
  final storage = ref.watch(secureStorageProvider);
  final authInterceptor = AuthInterceptor(storage: storage, dio: dio);
  dio.interceptors.add(authInterceptor);
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
  ref.onDispose(dio.close);
  return dio;
});

/// Interceptor auth dari [dioProvider] yang sudah terpasang — dipakai [AuthNotifier]
/// untuk subscribe ke `onLoggedOut` (mis. saat refresh token gagal).
final authInterceptorFromDioProvider = Provider<AuthInterceptor>((ref) {
  final dio = ref.watch(dioProvider);
  return dio.interceptors.whereType<AuthInterceptor>().first;
});

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient(ref.watch(dioProvider)));

/// Hasil decode envelope response backend `{success, data, error, meta?}`.
class ApiResponse {
  final dynamic data;
  final Map<String, dynamic>? meta;
  ApiResponse(this.data, this.meta);
}

/// Satu-satunya lapisan yang bicara ke `dio` (`docs/ARCHITECTURE.md` §1) — expose
/// method HTTP generik, decode envelope, lempar [ApiException] typed saat gagal.
class ApiClient {
  final Dio dio;
  ApiClient(this.dio);

  Future<ApiResponse> get(String path, {Map<String, dynamic>? queryParameters}) =>
      _send(() => dio.get(path, queryParameters: queryParameters));

  Future<ApiResponse> post(String path, {dynamic data, Options? options}) =>
      _send(() => dio.post(path, data: data, options: options));

  Future<ApiResponse> put(String path, {dynamic data}) =>
      _send(() => dio.put(path, data: data));

  Future<ApiResponse> patch(String path, {dynamic data}) =>
      _send(() => dio.patch(path, data: data));

  Future<ApiResponse> delete(String path, {dynamic data}) =>
      _send(() => dio.delete(path, data: data));

  Future<ApiResponse> _send(Future<Response> Function() request) async {
    try {
      final res = await request();
      final body = res.data as Map<String, dynamic>;
      return ApiResponse(body['data'], body['meta'] as Map<String, dynamic>?);
    } on DioException catch (e) {
      final err = e.error;
      if (err is ApiException) throw err;
      throw ApiException.network(e.message ?? 'Tidak dapat terhubung ke server');
    }
  }
}
