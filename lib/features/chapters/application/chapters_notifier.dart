import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/chapter_models.dart';
import '../data/chapter_repository.dart';

final chaptersNotifierProvider = AsyncNotifierProvider<ChaptersNotifier, List<Chapter>>(ChaptersNotifier.new);

class ChaptersNotifier extends AsyncNotifier<List<Chapter>> {
  late final ChapterRepository _repo;

  @override
  Future<List<Chapter>> build() {
    _repo = ref.watch(chapterRepositoryProvider);
    return _repo.list();
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() => _repo.list());
  }
}
