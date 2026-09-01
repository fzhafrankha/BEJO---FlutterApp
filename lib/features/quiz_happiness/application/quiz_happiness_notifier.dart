import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../../chapters/data/chapter_models.dart';
import '../data/quiz_happiness_repository.dart';

part 'quiz_happiness_notifier.freezed.dart';

@freezed
abstract class QuizHappinessState with _$QuizHappinessState {
  const factory QuizHappinessState.loading() = _Loading;
  const factory QuizHappinessState.error(String message) = _Error;
  const factory QuizHappinessState.inProgress({
    required List<QuizQuestion> questions,
    required int currentIndex,
    bool? lastAnswerCorrect,
  }) = _InProgress;
  const factory QuizHappinessState.finished({required int happiness}) = _Finished;
}

final quizHappinessNotifierProvider =
    NotifierProvider<QuizHappinessNotifier, QuizHappinessState>(QuizHappinessNotifier.new);

class QuizHappinessNotifier extends Notifier<QuizHappinessState> {
  late final QuizHappinessRepository _repo;
  int _lastHappiness = 0;

  @override
  QuizHappinessState build() {
    _repo = ref.watch(quizHappinessRepositoryProvider);
    _load();
    return const QuizHappinessState.loading();
  }

  Future<void> _load() async {
    try {
      final questions = await _repo.getQuestions();
      if (questions.isEmpty) {
        state = const QuizHappinessState.error('Belum ada soal quiz perasaan tersedia.');
        return;
      }
      state = QuizHappinessState.inProgress(questions: questions, currentIndex: 0);
    } on ApiException catch (e) {
      state = QuizHappinessState.error(errorMessageFor(e));
    }
  }

  Future<void> answer(int selectedOptionIndex) async {
    final current = state;
    if (current is! _InProgress) return;
    final question = current.questions[current.currentIndex];
    try {
      final result = await _repo.submit(questionId: question.id, selectedOptionIndex: selectedOptionIndex);
      _lastHappiness = result.happiness;
      state = current.copyWith(lastAnswerCorrect: result.isCorrect);
    } on ApiException catch (e) {
      state = QuizHappinessState.error(errorMessageFor(e));
    }
  }

  void next() {
    final current = state;
    if (current is! _InProgress) return;
    if (current.currentIndex + 1 >= current.questions.length) {
      state = QuizHappinessState.finished(happiness: _lastHappiness);
    } else {
      state = current.copyWith(currentIndex: current.currentIndex + 1, lastAnswerCorrect: null);
    }
  }
}
