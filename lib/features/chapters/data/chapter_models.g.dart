// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chapter _$ChapterFromJson(Map<String, dynamic> json) => _Chapter(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  orderIndex: (json['order_index'] as num).toInt(),
  rewardCurrency: (json['reward_currency'] as num).toInt(),
  isUnlocked: json['is_unlocked'] as bool,
  isCompleted: json['is_completed'] as bool,
  rewardClaimed: json['reward_claimed'] as bool,
);

Map<String, dynamic> _$ChapterToJson(_Chapter instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'order_index': instance.orderIndex,
  'reward_currency': instance.rewardCurrency,
  'is_unlocked': instance.isUnlocked,
  'is_completed': instance.isCompleted,
  'reward_claimed': instance.rewardClaimed,
};

_QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) =>
    _QuizQuestion(
      id: (json['id'] as num).toInt(),
      questionText: json['question_text'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$QuizQuestionToJson(_QuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_text': instance.questionText,
      'options': instance.options,
    };

_ChapterQuizResult _$ChapterQuizResultFromJson(Map<String, dynamic> json) =>
    _ChapterQuizResult(
      isCorrect: json['is_correct'] as bool,
      chapterDone: json['chapter_done'] as bool,
      rewardGiven: json['reward_given'] as bool,
    );

Map<String, dynamic> _$ChapterQuizResultToJson(_ChapterQuizResult instance) =>
    <String, dynamic>{
      'is_correct': instance.isCorrect,
      'chapter_done': instance.chapterDone,
      'reward_given': instance.rewardGiven,
    };

_HappinessQuizResult _$HappinessQuizResultFromJson(Map<String, dynamic> json) =>
    _HappinessQuizResult(
      isCorrect: json['is_correct'] as bool,
      happiness: (json['happiness'] as num).toInt(),
    );

Map<String, dynamic> _$HappinessQuizResultToJson(
  _HappinessQuizResult instance,
) => <String, dynamic>{
  'is_correct': instance.isCorrect,
  'happiness': instance.happiness,
};
