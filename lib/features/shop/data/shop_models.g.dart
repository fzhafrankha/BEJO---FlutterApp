// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Accessory _$AccessoryFromJson(Map<String, dynamic> json) => _Accessory(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  category: _categoryFromJson(json['category'] as String),
  slot: _slotFromJson(json['slot'] as String?),
  imageUrl: json['image_url'] as String,
  price: (json['price'] as num).toInt(),
  happinessValue: (json['happiness_value'] as num?)?.toInt(),
);

Map<String, dynamic> _$AccessoryToJson(_Accessory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _categoryToJson(instance.category),
      'slot': _slotToJson(instance.slot),
      'image_url': instance.imageUrl,
      'price': instance.price,
      'happiness_value': instance.happinessValue,
    };

_UserAccessory _$UserAccessoryFromJson(Map<String, dynamic> json) =>
    _UserAccessory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      category: _categoryFromJson(json['category'] as String),
      slot: _slotFromJson(json['slot'] as String?),
      imageUrl: json['image_url'] as String,
      happinessValue: (json['happiness_value'] as num?)?.toInt(),
      isEquipped: json['is_equipped'] as bool,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$UserAccessoryToJson(_UserAccessory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _categoryToJson(instance.category),
      'slot': _slotToJson(instance.slot),
      'image_url': instance.imageUrl,
      'happiness_value': instance.happinessValue,
      'is_equipped': instance.isEquipped,
      'quantity': instance.quantity,
    };

_PurchaseResult _$PurchaseResultFromJson(Map<String, dynamic> json) =>
    _PurchaseResult(
      accessoryId: (json['accessory_id'] as num).toInt(),
      currencyBalance: (json['currency_balance'] as num).toInt(),
    );

Map<String, dynamic> _$PurchaseResultToJson(_PurchaseResult instance) =>
    <String, dynamic>{
      'accessory_id': instance.accessoryId,
      'currency_balance': instance.currencyBalance,
    };

_GachaResult _$GachaResultFromJson(Map<String, dynamic> json) => _GachaResult(
  accessoryIds: (json['accessory_ids'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  currencySpent: (json['currency_spent'] as num).toInt(),
  currencyBalance: (json['currency_balance'] as num).toInt(),
);

Map<String, dynamic> _$GachaResultToJson(_GachaResult instance) =>
    <String, dynamic>{
      'accessory_ids': instance.accessoryIds,
      'currency_spent': instance.currencySpent,
      'currency_balance': instance.currencyBalance,
    };
