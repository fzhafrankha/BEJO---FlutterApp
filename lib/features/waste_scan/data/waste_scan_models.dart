import 'package:freezed_annotation/freezed_annotation.dart';

part 'waste_scan_models.freezed.dart';
part 'waste_scan_models.g.dart';

@freezed
abstract class WasteScanSubmitRequest with _$WasteScanSubmitRequest {
  const factory WasteScanSubmitRequest({
    @JsonKey(name: 'classified_label') required String classifiedLabel,
    double? confidence,
  }) = _WasteScanSubmitRequest;

  factory WasteScanSubmitRequest.fromJson(Map<String, dynamic> json) =>
      _$WasteScanSubmitRequestFromJson(json);
}

/// Response `POST /waste-scan/submit` — hanya 2 field ini (tidak ada
/// id/classified_label/created_at di response aktual).
@freezed
abstract class WasteScanResult with _$WasteScanResult {
  const factory WasteScanResult({
    @JsonKey(name: 'currency_awarded') required int currencyAwarded,
    @JsonKey(name: 'currency_balance') required int currencyBalance,
  }) = _WasteScanResult;

  factory WasteScanResult.fromJson(Map<String, dynamic> json) => _$WasteScanResultFromJson(json);
}
