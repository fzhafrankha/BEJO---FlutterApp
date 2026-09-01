import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import 'point_history_models.dart';

final pointHistoryRepositoryProvider = Provider<PointHistoryRepository>((ref) {
  return PointHistoryRepository(ref.watch(apiClientProvider));
});

class PointHistoryRepository {
  final ApiClient apiClient;
  PointHistoryRepository(this.apiClient);

  Future<WeeklyHistory> weekly() async {
    final res = await apiClient.get('/points/history/weekly');
    return WeeklyHistory.fromJson(res.data as Map<String, dynamic>);
  }
}
