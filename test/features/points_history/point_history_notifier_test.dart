import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tamagotchi_app/features/points_history/application/point_history_notifier.dart';
import 'package:tamagotchi_app/features/points_history/data/point_history_models.dart';
import 'package:tamagotchi_app/features/points_history/data/point_history_repository.dart';

class MockPointHistoryRepository extends Mock implements PointHistoryRepository {}

void main() {
  late MockPointHistoryRepository repo;
  late ProviderContainer container;

  setUp(() {
    repo = MockPointHistoryRepository();
    container = ProviderContainer(overrides: [pointHistoryRepositoryProvider.overrideWithValue(repo)]);
    addTearDown(container.dispose);
  });

  test('memuat 7 hari riwayat EcoPoin dari repository', () async {
    final weekly = WeeklyHistory(
      days: List.generate(7, (i) => DayEarning(date: '2026-08-2${i + 1}', totalEarned: i * 10)),
      totalEarned: 210,
    );
    when(() => repo.weekly()).thenAnswer((_) async => weekly);

    container.read(pointHistoryNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);

    final state = container.read(pointHistoryNotifierProvider);
    expect(state.value?.days.length, 7);
    expect(state.value?.totalEarned, 210);
  });

  test('refresh mengambil ulang data terbaru', () async {
    when(() => repo.weekly()).thenAnswer(
      (_) async => WeeklyHistory(days: List.generate(7, (i) => DayEarning(date: '2026-08-2$i', totalEarned: 0)), totalEarned: 0),
    );

    final notifier = container.read(pointHistoryNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);

    when(() => repo.weekly()).thenAnswer(
      (_) async => WeeklyHistory(days: List.generate(7, (i) => DayEarning(date: '2026-08-2$i', totalEarned: 5)), totalEarned: 35),
    );
    await notifier.refresh();

    expect(container.read(pointHistoryNotifierProvider).value?.totalEarned, 35);
  });
}
