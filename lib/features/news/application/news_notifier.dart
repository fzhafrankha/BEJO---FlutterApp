import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../data/news_models.dart';
import '../data/news_repository.dart';

part 'news_notifier.freezed.dart';

const _pageSize = 20;

@freezed
abstract class NewsListState with _$NewsListState {
  const factory NewsListState({
    @Default([]) List<NewsItem> items,
    @Default(1) int page,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
    @Default(true) bool isInitialLoading,
    String? errorMessage,
  }) = _NewsListState;
}

final newsNotifierProvider = NotifierProvider<NewsNotifier, NewsListState>(NewsNotifier.new);

class NewsNotifier extends Notifier<NewsListState> {
  late final NewsRepository _repo;

  @override
  NewsListState build() {
    _repo = ref.watch(newsRepositoryProvider);
    _loadFirstPage();
    return const NewsListState();
  }

  Future<void> _loadFirstPage() async {
    try {
      final result = await _repo.list(page: 1, limit: _pageSize);
      state = NewsListState(
        items: result.items,
        page: 1,
        hasMore: result.items.length < result.total,
        isInitialLoading: false,
      );
    } on ApiException catch (e) {
      state = state.copyWith(isInitialLoading: false, errorMessage: errorMessageFor(e));
    }
  }

  Future<void> refresh() async {
    state = const NewsListState();
    await _loadFirstPage();
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore || state.isInitialLoading) return;
    state = state.copyWith(isLoadingMore: true);
    try {
      final nextPage = state.page + 1;
      final result = await _repo.list(page: nextPage, limit: _pageSize);
      final combined = [...state.items, ...result.items];
      state = state.copyWith(
        items: combined,
        page: nextPage,
        hasMore: combined.length < result.total,
        isLoadingMore: false,
      );
    } on ApiException catch (e) {
      state = state.copyWith(isLoadingMore: false, errorMessage: errorMessageFor(e));
    }
  }
}
