import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_history_models.freezed.dart';
part 'point_history_models.g.dart';

/// Sumber: `GET /points/history/weekly` (`backend/internal/pointhistory/service.go`).
/// `date` format `YYYY-MM-DD`, rolling 7-hari (bukan minggu kalender), sudah
/// zero-filled dari backend untuk hari tanpa pendapatan.
@freezed
abstract class DayEarning with _$DayEarning {
  const factory DayEarning({
    required String date,
    @JsonKey(name: 'total_earned') required int totalEarned,
  }) = _DayEarning;

  factory DayEarning.fromJson(Map<String, dynamic> json) => _$DayEarningFromJson(json);
}

@freezed
abstract class WeeklyHistory with _$WeeklyHistory {
  const factory WeeklyHistory({
    required List<DayEarning> days,
    @JsonKey(name: 'total_earned') required int totalEarned,
  }) = _WeeklyHistory;

  factory WeeklyHistory.fromJson(Map<String, dynamic> json) => _$WeeklyHistoryFromJson(json);
}
