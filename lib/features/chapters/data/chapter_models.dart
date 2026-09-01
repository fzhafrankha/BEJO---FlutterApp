import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_models.freezed.dart';
part 'chapter_models.g.dart';

/// Sumber: `GET /chapters` (`backend/docs/API_CONTRACT.md` §Quiz — Chapter).
@freezed
abstract class Chapter with _$Chapter {
  const factory Chapter({
    required int id,
    required String title,
    @JsonKey(name: 'order_index') required int orderIndex,
    @JsonKey(name: 'reward_currency') required int rewardCurrency,
    @JsonKey(name: 'is_unlocked') required bool isUnlocked,
    @JsonKey(name: 'is_completed') required bool isCompleted,
    @JsonKey(name: 'reward_claimed') required bool rewardClaimed,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}

/// Sumber: `GET /chapters/:id/quiz` & `GET /quiz/happiness` — `correct_option_index`
/// SENGAJA tidak dimodelkan (tidak pernah dikirim backend saat mengambil soal).
@freezed
abstract class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required int id,
    @JsonKey(name: 'question_text') required String questionText,
    required List<String> options,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);
}

/// Response `POST /chapters/:id/quiz/submit` — TIDAK menyertakan reward_currency
/// nominal atau chapter berikutnya, client ambil itu dari `GET /chapters` ulang.
@freezed
abstract class ChapterQuizResult with _$ChapterQuizResult {
  const factory ChapterQuizResult({
    @JsonKey(name: 'is_correct') required bool isCorrect,
    @JsonKey(name: 'chapter_done') required bool chapterDone,
    @JsonKey(name: 'reward_given') required bool rewardGiven,
  }) = _ChapterQuizResult;

  factory ChapterQuizResult.fromJson(Map<String, dynamic> json) => _$ChapterQuizResultFromJson(json);
}

/// Response `POST /quiz/happiness/submit`.
@freezed
abstract class HappinessQuizResult with _$HappinessQuizResult {
  const factory HappinessQuizResult({
    @JsonKey(name: 'is_correct') required bool isCorrect,
    required int happiness,
  }) = _HappinessQuizResult;

  factory HappinessQuizResult.fromJson(Map<String, dynamic> json) => _$HappinessQuizResultFromJson(json);
}
