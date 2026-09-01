import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/accessory_slot.dart';

part 'shop_models.freezed.dart';
part 'shop_models.g.dart';

enum AccessoryCategory { accessory, food }

AccessoryCategory _categoryFromJson(String value) =>
    AccessoryCategory.values.firstWhere((e) => e.name == value);
String _categoryToJson(AccessoryCategory c) => c.name;

AccessorySlot? _slotFromJson(String? value) => value == null ? null : accessorySlotFromJson(value);
String? _slotToJson(AccessorySlot? slot) => slot == null ? null : accessorySlotToJson(slot);

/// Sumber: `GET /shop/accessories`. `category` membedakan kosmetik (bisa
/// di-equip ke `slot`) dari makanan (dikonsumsi via feed-item, `slot` selalu null).
@freezed
abstract class Accessory with _$Accessory {
  const factory Accessory({
    required int id,
    required String name,
    @JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson)
    required AccessoryCategory category,
    @JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) AccessorySlot? slot,
    @JsonKey(name: 'image_url') required String imageUrl,
    required int price,
    @JsonKey(name: 'happiness_value') int? happinessValue,
  }) = _Accessory;

  factory Accessory.fromJson(Map<String, dynamic> json) => _$AccessoryFromJson(json);
}

/// Sumber: `GET /shop/my-accessories` — objek flat (bukan nested `accessory`).
@freezed
abstract class UserAccessory with _$UserAccessory {
  const factory UserAccessory({
    required int id,
    required String name,
    @JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson)
    required AccessoryCategory category,
    @JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) AccessorySlot? slot,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'happiness_value') int? happinessValue,
    @JsonKey(name: 'is_equipped') required bool isEquipped,
    required int quantity,
  }) = _UserAccessory;

  factory UserAccessory.fromJson(Map<String, dynamic> json) => _$UserAccessoryFromJson(json);
}

@freezed
abstract class PurchaseResult with _$PurchaseResult {
  const factory PurchaseResult({
    @JsonKey(name: 'accessory_id') required int accessoryId,
    @JsonKey(name: 'currency_balance') required int currencyBalance,
  }) = _PurchaseResult;

  factory PurchaseResult.fromJson(Map<String, dynamic> json) => _$PurchaseResultFromJson(json);
}

/// Response `POST /shop/gacha/pull` — list ID (bisa duplikat, multi-pull),
/// client cocokkan tiap ID ke katalog untuk dapat nama/gambar.
@freezed
abstract class GachaResult with _$GachaResult {
  const factory GachaResult({
    @JsonKey(name: 'accessory_ids') required List<int> accessoryIds,
    @JsonKey(name: 'currency_spent') required int currencySpent,
    @JsonKey(name: 'currency_balance') required int currencyBalance,
  }) = _GachaResult;

  factory GachaResult.fromJson(Map<String, dynamic> json) => _$GachaResultFromJson(json);
}
