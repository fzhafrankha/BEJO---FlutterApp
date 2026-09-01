import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../data/chapter_models.dart';
import '../data/chapter_repository.dart';

part 'chapter_quiz_notifier.freezed.dart';

@freezed
abstract class ChapterQuizState with _$ChapterQuizState {
  const factory ChapterQuizState.loading() = _Loading;
  const factory ChapterQuizState.error(String message) = _Error;
  const factory ChapterQuizState.inProgress({
    required List<QuizQuestion> questions,
    required int currentIndex,
    bool? lastAnswerCorrect,
  }) = _InProgress;
  const factory ChapterQuizState.finished({required bool rewardGiven}) = _Finished;
}

final chapterQuizNotifierProvider =
    NotifierProvider<ChapterQuizNotifier, ChapterQuizState>(ChapterQuizNotifier.new);

class ChapterQuizNotifier extends Notifier<ChapterQuizState> {
  late final ChapterRepository _repo;
  int? _chapterId;
  bool _lastRewardGiven = false;

  @override
  ChapterQuizState build() {
    _repo = ref.watch(chapterRepositoryProvider);
    return const ChapterQuizState.loading();
  }

  Future<void> start(int chapterId) async {
    _chapterId = chapterId;
    state = const ChapterQuizState.loading();
    try {
      final questions = await _repo.getQuiz(chapterId);
      if (questions.isEmpty) {
        state = const ChapterQuizState.error('Belum ada soal untuk chapter ini.');
        return;
      }
      state = ChapterQuizState.inProgress(questions: questions, currentIndex: 0);
    } on ApiException catch (e) {
      state = ChapterQuizState.error(errorMessageFor(e));
    }
  }

  Future<void> answer(int selectedOptionIndex) async {
    final current = state;
    if (current is! _InProgress) return;
    final question = current.questions[current.currentIndex];
    try {
      final result = await _repo.submitQuiz(
        chapterId: _chapterId!,
        questionId: question.id,
        selectedOptionIndex: selectedOptionIndex,
      );
      _lastRewardGiven = result.rewardGiven;
      state = current.copyWith(lastAnswerCorrect: result.isCorrect);
    } on ApiException catch (e) {
      state = ChapterQuizState.error(errorMessageFor(e));
    }
  }

  void next() {
    final current = state;
    if (current is! _InProgress) return;
    if (current.currentIndex + 1 >= current.questions.length) {
      state = ChapterQuizState.finished(rewardGiven: _lastRewardGiven);
    } else {
      state = current.copyWith(currentIndex: current.currentIndex + 1, lastAnswerCorrect: null);
    }
  }
}
