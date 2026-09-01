import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/point_history_models.dart';
import '../data/point_history_repository.dart';

final pointHistoryNotifierProvider =
    AsyncNotifierProvider<PointHistoryNotifier, WeeklyHistory>(PointHistoryNotifier.new);

class PointHistoryNotifier extends AsyncNotifier<WeeklyHistory> {
  late final PointHistoryRepository _repo;

  @override
  Future<WeeklyHistory> build() {
    _repo = ref.watch(pointHistoryRepositoryProvider);
    return _repo.weekly();
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => _repo.weekly());
  }
}
