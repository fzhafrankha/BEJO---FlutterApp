// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waste_scan_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WasteScanSubmitRequest _$WasteScanSubmitRequestFromJson(
  Map<String, dynamic> json,
) => _WasteScanSubmitRequest(
  classifiedLabel: json['classified_label'] as String,
  confidence: (json['confidence'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WasteScanSubmitRequestToJson(
  _WasteScanSubmitRequest instance,
) => <String, dynamic>{
  'classified_label': instance.classifiedLabel,
  'confidence': instance.confidence,
};

_WasteScanResult _$WasteScanResultFromJson(Map<String, dynamic> json) =>
    _WasteScanResult(
      currencyAwarded: (json['currency_awarded'] as num).toInt(),
      currencyBalance: (json['currency_balance'] as num).toInt(),
    );

Map<String, dynamic> _$WasteScanResultToJson(_WasteScanResult instance) =>
    <String, dynamic>{
      'currency_awarded': instance.currencyAwarded,
      'currency_balance': instance.currencyBalance,
    };
