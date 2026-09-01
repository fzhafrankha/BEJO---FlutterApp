import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/accessory_slot.dart';

part 'tamagotchi_models.freezed.dart';
part 'tamagotchi_models.g.dart';

/// Sumber: `GET/POST /tamagotchi/me*` (`backend/internal/tamagotchi/service.go`).
/// Tidak ada `id` di response — backend hanya expose field ini.
@freezed
abstract class EquippedAccessory with _$EquippedAccessory {
  const factory EquippedAccessory({
    required int id,
    required String name,
    @JsonKey(fromJson: accessorySlotFromJson, toJson: accessorySlotToJson) required AccessorySlot slot,
  }) = _EquippedAccessory;

  factory EquippedAccessory.fromJson(Map<String, dynamic> json) => _$EquippedAccessoryFromJson(json);
}

@freezed
abstract class Tamagotchi with _$Tamagotchi {
  const factory Tamagotchi({
    required int happiness,
    @JsonKey(name: 'growth_stage') required int growthStage,
    @JsonKey(name: 'last_fed_at') DateTime? lastFedAt,
    @JsonKey(name: 'equipped_accessories') required List<EquippedAccessory> equippedAccessories,
  }) = _Tamagotchi;

  factory Tamagotchi.fromJson(Map<String, dynamic> json) => _$TamagotchiFromJson(json);
}
