// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_history_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DayEarning _$DayEarningFromJson(Map<String, dynamic> json) => _DayEarning(
  date: json['date'] as String,
  totalEarned: (json['total_earned'] as num).toInt(),
);

Map<String, dynamic> _$DayEarningToJson(_DayEarning instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total_earned': instance.totalEarned,
    };

_WeeklyHistory _$WeeklyHistoryFromJson(Map<String, dynamic> json) =>
    _WeeklyHistory(
      days: (json['days'] as List<dynamic>)
          .map((e) => DayEarning.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalEarned: (json['total_earned'] as num).toInt(),
    );

Map<String, dynamic> _$WeeklyHistoryToJson(_WeeklyHistory instance) =>
    <String, dynamic>{
      'days': instance.days,
      'total_earned': instance.totalEarned,
    };
