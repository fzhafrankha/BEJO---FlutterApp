import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tamagotchi_app/features/news/application/news_notifier.dart';
import 'package:tamagotchi_app/features/news/data/news_models.dart';
import 'package:tamagotchi_app/features/news/data/news_repository.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

NewsItem _item(int id) => NewsItem(
      id: id,
      title: 'Berita $id',
      url: 'https://example.com/$id',
      imageUrl: '/uploads/news/$id.png',
      source: 'Sumber',
      publishedAt: DateTime(2026, 1, id),
    );

void main() {
  late MockNewsRepository repo;
  late ProviderContainer container;

  setUp(() {
    repo = MockNewsRepository();
    container = ProviderContainer(overrides: [newsRepositoryProvider.overrideWithValue(repo)]);
    addTearDown(container.dispose);
  });

  test('cache kosong (GNEWS_API_KEY belum diisi) -> empty state, bukan error', () async {
    when(() => repo.list(page: 1, limit: 20)).thenAnswer((_) async => NewsPage([], 0));

    container.read(newsNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);

    final state = container.read(newsNotifierProvider);
    expect(state.items, isEmpty);
    expect(state.isInitialLoading, false);
    expect(state.errorMessage, isNull);
    expect(state.hasMore, false);
  });

  test('loadMore menambah halaman berikutnya sampai total terpenuhi', () async {
    when(() => repo.list(page: 1, limit: 20)).thenAnswer((_) async => NewsPage(List.generate(20, _item), 25));
    when(() => repo.list(page: 2, limit: 20)).thenAnswer((_) async => NewsPage(List.generate(5, (i) => _item(20 + i)), 25));

    final notifier = container.read(newsNotifierProvider.notifier);
    await Future<void>.delayed(Duration.zero);
    expect(container.read(newsNotifierProvider).hasMore, true);

    await notifier.loadMore();

    final state = container.read(newsNotifierProvider);
    expect(state.items.length, 25);
    expect(state.hasMore, false);
  });
}
