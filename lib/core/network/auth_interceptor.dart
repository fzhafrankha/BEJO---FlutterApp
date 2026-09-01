import 'dart:async';

import 'package:dio/dio.dart';

import '../storage/secure_storage.dart';
import 'api_exception.dart';

/// Endpoint yang tidak butuh (dan tidak boleh mencoba refresh atas) Authorization header.
const _publicPaths = [
  '/auth/register',
  '/auth/send-otp',
  '/auth/verify-otp',
  '/auth/login',
  '/auth/refresh',
];

bool _isPublic(String path) => _publicPaths.any((p) => path.contains(p));

/// Satu interceptor yang menangani: (1) inject Authorization header, (2) auto-refresh
/// token transparan saat 401 dengan concurrency guard, (3) mapping error envelope
/// backend ke [ApiException] typed (`docs/ARCHITECTURE.md` §3.2, §3.4).
///
/// Backend selalu memasangkan `success:false` dengan HTTP status non-2xx
/// (`internal/platform/httpresponse/response.go`), jadi semua error masuk lewat
/// `onError`, tidak pernah lewat `onResponse`.
class AuthInterceptor extends Interceptor {
  final SecureStorage storage;
  final Dio dio;

  final _loggedOutController = StreamController<void>.broadcast();
  Stream<void> get onLoggedOut => _loggedOutController.stream;

  Completer<bool>? _refreshCompleter;

  AuthInterceptor({required this.storage, required this.dio});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_isPublic(options.path)) {
      final token = await storage.readAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final path = err.requestOptions.path;
    final alreadyRetried = err.requestOptions.extra['retried'] == true;

    if (err.response?.statusCode == 401 && !_isPublic(path) && !alreadyRetried) {
      final refreshed = await _refreshToken();
      if (refreshed) {
        try {
          final opts = err.requestOptions;
          opts.extra['retried'] = true;
          final token = await storage.readAccessToken();
          opts.headers['Authorization'] = 'Bearer $token';
          final response = await dio.fetch(opts);
          return handler.resolve(response);
        } on DioException catch (retryErr) {
          return handler.next(retryErr);
        }
      } else {
        await storage.clear();
        _loggedOutController.add(null);
      }
    }

    handler.next(_mapToApiException(err));
  }

  Future<bool> _refreshToken() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;
    final completer = Completer<bool>();
    _refreshCompleter = completer;
    try {
      final refreshToken = await storage.readRefreshToken();
      if (refreshToken == null) {
        completer.complete(false);
      } else {
        final response = await dio.post(
          '/auth/refresh',
          data: {'refresh_token': refreshToken},
        );
        final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
        await storage.saveTokens(
          accessToken: data['access_token'] as String,
          refreshToken: data['refresh_token'] as String,
        );
        completer.complete(true);
      }
    } catch (_) {
      completer.complete(false);
    } finally {
      _refreshCompleter = null;
    }
    return completer.future;
  }

  DioException _mapToApiException(DioException err) {
    final body = err.response?.data;
    if (body is Map<String, dynamic> && body['error'] is Map) {
      final errorBody = body['error'] as Map<String, dynamic>;
      return err.copyWith(
        error: ApiException(
          errorBody['code'] as String? ?? 'UNKNOWN_ERROR',
          errorBody['message'] as String? ?? 'Terjadi kesalahan',
          statusCode: err.response?.statusCode,
        ),
      );
    }
    return err.copyWith(error: ApiException.network(err.message ?? 'Tidak dapat terhubung ke server'));
  }
}
