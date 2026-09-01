import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import 'waste_scan_models.dart';

final wasteScanRepositoryProvider = Provider<WasteScanRepository>((ref) {
  return WasteScanRepository(ref.watch(apiClientProvider));
});

class WasteScanRepository {
  final ApiClient apiClient;
  WasteScanRepository(this.apiClient);

  /// [idempotencyKey] wajib — dipakai server untuk mencegah double-credit
  /// currency kalau request di-retry (`docs/ARCHITECTURE.md` §3.3).
  Future<WasteScanResult> submit(WasteScanSubmitRequest request, {required String idempotencyKey}) async {
    final res = await apiClient.post(
      '/waste-scan/submit',
      data: request.toJson(),
      options: Options(headers: {'Idempotency-Key': idempotencyKey}),
    );
    return WasteScanResult.fromJson(res.data as Map<String, dynamic>);
  }
}
