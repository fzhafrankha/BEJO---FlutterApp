// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tamagotchi_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EquippedAccessory _$EquippedAccessoryFromJson(Map<String, dynamic> json) =>
    _EquippedAccessory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slot: accessorySlotFromJson(json['slot'] as String),
    );

Map<String, dynamic> _$EquippedAccessoryToJson(_EquippedAccessory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slot': accessorySlotToJson(instance.slot),
    };

_Tamagotchi _$TamagotchiFromJson(Map<String, dynamic> json) => _Tamagotchi(
  happiness: (json['happiness'] as num).toInt(),
  growthStage: (json['growth_stage'] as num).toInt(),
  lastFedAt: json['last_fed_at'] == null
      ? null
      : DateTime.parse(json['last_fed_at'] as String),
  equippedAccessories: (json['equipped_accessories'] as List<dynamic>)
      .map((e) => EquippedAccessory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TamagotchiToJson(_Tamagotchi instance) =>
    <String, dynamic>{
      'happiness': instance.happiness,
      'growth_stage': instance.growthStage,
      'last_fed_at': instance.lastFedAt?.toIso8601String(),
      'equipped_accessories': instance.equippedAccessories,
    };
