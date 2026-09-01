/// Exception typed dari response envelope backend `{success:false, error:{code,message}}`.
///
/// Dilempar oleh [ApiClient] interceptor — repository dan application layer
/// menerima ini, bukan parsing `response.data['success']` manual berulang.
class ApiException implements Exception {
  final String code;
  final String message;
  final int? statusCode;

  ApiException(this.code, this.message, {this.statusCode});

  /// Dipakai saat request gagal total tanpa response server (timeout, no internet, dsb).
  factory ApiException.network(String message) =>
      ApiException('NETWORK_ERROR', message);

  /// Dipakai saat response tidak sesuai format envelope yang diharapkan.
  factory ApiException.malformed() =>
      ApiException('MALFORMED_RESPONSE', 'Respons server tidak valid');

  @override
  String toString() => 'ApiException($code, $message)';
}
