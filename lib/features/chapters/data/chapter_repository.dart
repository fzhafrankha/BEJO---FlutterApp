import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import 'chapter_content.dart';
import 'chapter_models.dart';

final chapterRepositoryProvider = Provider<ChapterRepository>((ref) {
  return ChapterRepository(ref.watch(apiClientProvider));
});

class ChapterRepository {
  final ApiClient apiClient;
  ChapterRepository(this.apiClient);

  Future<List<Chapter>> list() async {
    final res = await apiClient.get('/chapters');
    return (res.data as List).map((e) => Chapter.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<List<QuizQuestion>> getQuiz(int chapterId) async {
    final res = await apiClient.get('/chapters/$chapterId/quiz');
    return (res.data as List).map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<ChapterQuizResult> submitQuiz({
    required int chapterId,
    required int questionId,
    required int selectedOptionIndex,
  }) async {
    final res = await apiClient.post(
      '/chapters/$chapterId/quiz/submit',
      data: {'quiz_question_id': questionId, 'selected_option_index': selectedOptionIndex},
    );
    return ChapterQuizResult.fromJson(res.data as Map<String, dynamic>);
  }

  /// Materi lokal, bukan dari API (`docs/ARCHITECTURE.md` §5). Kalau asset
  /// untuk `chapterId` belum di-bundle, lempar exception eksplisit — jangan
  /// silent-fail, supaya UI bisa tampilkan error jelas (bukan crash generik).
  Future<ChapterContent> getLocalContent(int chapterId) async {
    try {
      final raw = await rootBundle.loadString('assets/chapters/chapter_$chapterId.json');
      return ChapterContent.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      throw StateError('Materi untuk chapter $chapterId belum tersedia di app.');
    }
  }
}
