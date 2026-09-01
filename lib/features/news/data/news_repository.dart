import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import 'news_models.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepository(ref.watch(apiClientProvider));
});

/// Hasil satu halaman `GET /news` — `total` dipakai notifier untuk tahu kapan
/// berhenti paginate (`docs/API_CONTRACT.md`: `meta.total`/`page`/`limit`).
class NewsPage {
  final List<NewsItem> items;
  final int total;
  NewsPage(this.items, this.total);
}

class NewsRepository {
  final ApiClient apiClient;
  NewsRepository(this.apiClient);

  Future<NewsPage> list({int page = 1, int limit = 20}) async {
    final res = await apiClient.get('/news', queryParameters: {'page': page, 'limit': limit});
    final items = (res.data as List).map((e) => NewsItem.fromJson(e as Map<String, dynamic>)).toList();
    final total = (res.meta?['total'] as num?)?.toInt() ?? items.length;
    return NewsPage(items, total);
  }
}
