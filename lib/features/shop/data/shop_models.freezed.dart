// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Accessory {

 int get id; String get name;@JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson) AccessoryCategory get category;@JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) AccessorySlot? get slot;@JsonKey(name: 'image_url') String get imageUrl; int get price;@JsonKey(name: 'happiness_value') int? get happinessValue;
/// Create a copy of Accessory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccessoryCopyWith<Accessory> get copyWith => _$AccessoryCopyWithImpl<Accessory>(this as Accessory, _$identity);

  /// Serializes this Accessory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Accessory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Accessory&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.slot, _this.slot) || other.slot == _this.slot)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.happinessValue, _this.happinessValue) || other.happinessValue == _this.happinessValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Accessory;
  return Object.hash(runtimeType,_this.id,_this.name,_this.category,_this.slot,_this.imageUrl,_this.price,_this.happinessValue);
}

@override
String toString() {
  final _this = this as Accessory;
  return 'Accessory(id: ${_this.id}, name: ${_this.name}, category: ${_this.category}, slot: ${_this.slot}, imageUrl: ${_this.imageUrl}, price: ${_this.price}, happinessValue: ${_this.happinessValue})';
}


}

/// @nodoc
abstract mixin class $AccessoryCopyWith<$Res>  {
  factory $AccessoryCopyWith(Accessory value, $Res Function(Accessory) _then) = _$AccessoryCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson) AccessoryCategory category,@JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) AccessorySlot? slot,@JsonKey(name: 'image_url') String imageUrl, int price,@JsonKey(name: 'happiness_value') int? happinessValue
});




}
/// @nodoc
class _$AccessoryCopyWithImpl<$Res>
    implements $AccessoryCopyWith<$Res> {
  _$AccessoryCopyWithImpl(this._self, this._then);

  final Accessory _self;
  final $Res Function(Accessory) _then;

/// Create a copy of Accessory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? slot = freezed,Object? imageUrl = null,Object? price = null,Object? happinessValue = freezed,}) {
  return _then(Accessory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AccessoryCategory,slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as AccessorySlot?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,happinessValue: freezed == happinessValue ? _self.happinessValue : happinessValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Accessory].
extension AccessoryPatterns on Accessory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Accessory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Accessory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Accessory value)  $default,){
final _that = this;
switch (_that) {
case _Accessory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Accessory value)?  $default,){
final _that = this;
switch (_that) {
case _Accessory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson)  AccessoryCategory category, @JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson)  AccessorySlot? slot, @JsonKey(name: 'image_url')  String imageUrl,  int price, @JsonKey(name: 'happiness_value')  int? happinessValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Accessory() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.slot,_that.imageUrl,_that.price,_that.happinessValue);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson)  AccessoryCategory category, @JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson)  AccessorySlot? slot, @JsonKey(name: 'image_url')  String imageUrl,  int price, @JsonKey(name: 'happiness_value')  int? happinessValue)  $default,) {final _that = this;
switch (_that) {
case _Accessory():
return $default(_that.id,_that.name,_that.category,_that.slot,_that.imageUrl,_that.price,_that.happinessValue);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson)  AccessoryCategory category, @JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson)  AccessorySlot? slot, @JsonKey(name: 'image_url')  String imageUrl,  int price, @JsonKey(name: 'happiness_value')  int? happinessValue)?  $default,) {final _that = this;
switch (_that) {
case _Accessory() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.slot,_that.imageUrl,_that.price,_that.happinessValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Accessory implements Accessory {
  const _Accessory({required this.id, required this.name, @JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson) required this.category, @JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) this.slot, @JsonKey(name: 'image_url') required this.imageUrl, required this.price, @JsonKey(name: 'happiness_value') this.happinessValue});
  factory _Accessory.fromJson(Map<String, dynamic> json) => _$AccessoryFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson) final  AccessoryCategory category;
@override@JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) final  AccessorySlot? slot;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override final  int price;
@override@JsonKey(name: 'happiness_value') final  int? happinessValue;

/// Create a copy of Accessory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccessoryCopyWith<_Accessory> get copyWith => __$AccessoryCopyWithImpl<_Accessory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccessoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Accessory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.happinessValue, happinessValue) || other.happinessValue == happinessValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,category,slot,imageUrl,price,happinessValue);
}

@override
String toString() {
    return 'Accessory(id: $id, name: $name, category: $category, slot: $slot, imageUrl: $imageUrl, price: $price, happinessValue: $happinessValue)';
}


}

/// @nodoc
abstract mixin class _$AccessoryCopyWith<$Res> implements $AccessoryCopyWith<$Res> {
  factory _$AccessoryCopyWith(_Accessory value, $Res Function(_Accessory) _then) = __$AccessoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson) AccessoryCategory category,@JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) AccessorySlot? slot,@JsonKey(name: 'image_url') String imageUrl, int price,@JsonKey(name: 'happiness_value') int? happinessValue
});




}
/// @nodoc
class __$AccessoryCopyWithImpl<$Res>
    implements _$AccessoryCopyWith<$Res> {
  __$AccessoryCopyWithImpl(this._self, this._then);

  final _Accessory _self;
  final $Res Function(_Accessory) _then;

/// Create a copy of Accessory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? slot = freezed,Object? imageUrl = null,Object? price = null,Object? happinessValue = freezed,}) {
  return _then(_Accessory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AccessoryCategory,slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as AccessorySlot?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,happinessValue: freezed == happinessValue ? _self.happinessValue : happinessValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$UserAccessory {

 int get id; String get name;@JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson) AccessoryCategory get category;@JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) AccessorySlot? get slot;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'happiness_value') int? get happinessValue;@JsonKey(name: 'is_equipped') bool get isEquipped; int get quantity;
/// Create a copy of UserAccessory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAccessoryCopyWith<UserAccessory> get copyWith => _$UserAccessoryCopyWithImpl<UserAccessory>(this as UserAccessory, _$identity);

  /// Serializes this UserAccessory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserAccessory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAccessory&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.slot, _this.slot) || other.slot == _this.slot)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.happinessValue, _this.happinessValue) || other.happinessValue == _this.happinessValue)&&(identical(other.isEquipped, _this.isEquipped) || other.isEquipped == _this.isEquipped)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserAccessory;
  return Object.hash(runtimeType,_this.id,_this.name,_this.category,_this.slot,_this.imageUrl,_this.happinessValue,_this.isEquipped,_this.quantity);
}

@override
String toString() {
  final _this = this as UserAccessory;
  return 'UserAccessory(id: ${_this.id}, name: ${_this.name}, category: ${_this.category}, slot: ${_this.slot}, imageUrl: ${_this.imageUrl}, happinessValue: ${_this.happinessValue}, isEquipped: ${_this.isEquipped}, quantity: ${_this.quantity})';
}


}

/// @nodoc
abstract mixin class $UserAccessoryCopyWith<$Res>  {
  factory $UserAccessoryCopyWith(UserAccessory value, $Res Function(UserAccessory) _then) = _$UserAccessoryCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson) AccessoryCategory category,@JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) AccessorySlot? slot,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'happiness_value') int? happinessValue,@JsonKey(name: 'is_equipped') bool isEquipped, int quantity
});




}
/// @nodoc
class _$UserAccessoryCopyWithImpl<$Res>
    implements $UserAccessoryCopyWith<$Res> {
  _$UserAccessoryCopyWithImpl(this._self, this._then);

  final UserAccessory _self;
  final $Res Function(UserAccessory) _then;

/// Create a copy of UserAccessory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? slot = freezed,Object? imageUrl = null,Object? happinessValue = freezed,Object? isEquipped = null,Object? quantity = null,}) {
  return _then(UserAccessory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AccessoryCategory,slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as AccessorySlot?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,happinessValue: freezed == happinessValue ? _self.happinessValue : happinessValue // ignore: cast_nullable_to_non_nullable
as int?,isEquipped: null == isEquipped ? _self.isEquipped : isEquipped // ignore: cast_nullable_to_non_nullable
as bool,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAccessory].
extension UserAccessoryPatterns on UserAccessory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAccessory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAccessory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAccessory value)  $default,){
final _that = this;
switch (_that) {
case _UserAccessory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAccessory value)?  $default,){
final _that = this;
switch (_that) {
case _UserAccessory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson)  AccessoryCategory category, @JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson)  AccessorySlot? slot, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'happiness_value')  int? happinessValue, @JsonKey(name: 'is_equipped')  bool isEquipped,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAccessory() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.slot,_that.imageUrl,_that.happinessValue,_that.isEquipped,_that.quantity);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson)  AccessoryCategory category, @JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson)  AccessorySlot? slot, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'happiness_value')  int? happinessValue, @JsonKey(name: 'is_equipped')  bool isEquipped,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _UserAccessory():
return $default(_that.id,_that.name,_that.category,_that.slot,_that.imageUrl,_that.happinessValue,_that.isEquipped,_that.quantity);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson)  AccessoryCategory category, @JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson)  AccessorySlot? slot, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'happiness_value')  int? happinessValue, @JsonKey(name: 'is_equipped')  bool isEquipped,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _UserAccessory() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.slot,_that.imageUrl,_that.happinessValue,_that.isEquipped,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAccessory implements UserAccessory {
  const _UserAccessory({required this.id, required this.name, @JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson) required this.category, @JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) this.slot, @JsonKey(name: 'image_url') required this.imageUrl, @JsonKey(name: 'happiness_value') this.happinessValue, @JsonKey(name: 'is_equipped') required this.isEquipped, required this.quantity});
  factory _UserAccessory.fromJson(Map<String, dynamic> json) => _$UserAccessoryFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson) final  AccessoryCategory category;
@override@JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) final  AccessorySlot? slot;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'happiness_value') final  int? happinessValue;
@override@JsonKey(name: 'is_equipped') final  bool isEquipped;
@override final  int quantity;

/// Create a copy of UserAccessory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAccessoryCopyWith<_UserAccessory> get copyWith => __$UserAccessoryCopyWithImpl<_UserAccessory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAccessoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAccessory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.happinessValue, happinessValue) || other.happinessValue == happinessValue)&&(identical(other.isEquipped, isEquipped) || other.isEquipped == isEquipped)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,category,slot,imageUrl,happinessValue,isEquipped,quantity);
}

@override
String toString() {
    return 'UserAccessory(id: $id, name: $name, category: $category, slot: $slot, imageUrl: $imageUrl, happinessValue: $happinessValue, isEquipped: $isEquipped, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$UserAccessoryCopyWith<$Res> implements $UserAccessoryCopyWith<$Res> {
  factory _$UserAccessoryCopyWith(_UserAccessory value, $Res Function(_UserAccessory) _then) = __$UserAccessoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'category', fromJson: _categoryFromJson, toJson: _categoryToJson) AccessoryCategory category,@JsonKey(name: 'slot', fromJson: _slotFromJson, toJson: _slotToJson) AccessorySlot? slot,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'happiness_value') int? happinessValue,@JsonKey(name: 'is_equipped') bool isEquipped, int quantity
});




}
/// @nodoc
class __$UserAccessoryCopyWithImpl<$Res>
    implements _$UserAccessoryCopyWith<$Res> {
  __$UserAccessoryCopyWithImpl(this._self, this._then);

  final _UserAccessory _self;
  final $Res Function(_UserAccessory) _then;

/// Create a copy of UserAccessory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? slot = freezed,Object? imageUrl = null,Object? happinessValue = freezed,Object? isEquipped = null,Object? quantity = null,}) {
  return _then(_UserAccessory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AccessoryCategory,slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as AccessorySlot?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,happinessValue: freezed == happinessValue ? _self.happinessValue : happinessValue // ignore: cast_nullable_to_non_nullable
as int?,isEquipped: null == isEquipped ? _self.isEquipped : isEquipped // ignore: cast_nullable_to_non_nullable
as bool,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PurchaseResult {

@JsonKey(name: 'accessory_id') int get accessoryId;@JsonKey(name: 'currency_balance') int get currencyBalance;
/// Create a copy of PurchaseResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseResultCopyWith<PurchaseResult> get copyWith => _$PurchaseResultCopyWithImpl<PurchaseResult>(this as PurchaseResult, _$identity);

  /// Serializes this PurchaseResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PurchaseResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseResult&&(identical(other.accessoryId, _this.accessoryId) || other.accessoryId == _this.accessoryId)&&(identical(other.currencyBalance, _this.currencyBalance) || other.currencyBalance == _this.currencyBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PurchaseResult;
  return Object.hash(runtimeType,_this.accessoryId,_this.currencyBalance);
}

@override
String toString() {
  final _this = this as PurchaseResult;
  return 'PurchaseResult(accessoryId: ${_this.accessoryId}, currencyBalance: ${_this.currencyBalance})';
}


}

/// @nodoc
abstract mixin class $PurchaseResultCopyWith<$Res>  {
  factory $PurchaseResultCopyWith(PurchaseResult value, $Res Function(PurchaseResult) _then) = _$PurchaseResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'accessory_id') int accessoryId,@JsonKey(name: 'currency_balance') int currencyBalance
});




}
/// @nodoc
class _$PurchaseResultCopyWithImpl<$Res>
    implements $PurchaseResultCopyWith<$Res> {
  _$PurchaseResultCopyWithImpl(this._self, this._then);

  final PurchaseResult _self;
  final $Res Function(PurchaseResult) _then;

/// Create a copy of PurchaseResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessoryId = null,Object? currencyBalance = null,}) {
  return _then(PurchaseResult(
accessoryId: null == accessoryId ? _self.accessoryId : accessoryId // ignore: cast_nullable_to_non_nullable
as int,currencyBalance: null == currencyBalance ? _self.currencyBalance : currencyBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseResult].
extension PurchaseResultPatterns on PurchaseResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseResult value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseResult value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'accessory_id')  int accessoryId, @JsonKey(name: 'currency_balance')  int currencyBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseResult() when $default != null:
return $default(_that.accessoryId,_that.currencyBalance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'accessory_id')  int accessoryId, @JsonKey(name: 'currency_balance')  int currencyBalance)  $default,) {final _that = this;
switch (_that) {
case _PurchaseResult():
return $default(_that.accessoryId,_that.currencyBalance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'accessory_id')  int accessoryId, @JsonKey(name: 'currency_balance')  int currencyBalance)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseResult() when $default != null:
return $default(_that.accessoryId,_that.currencyBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurchaseResult implements PurchaseResult {
  const _PurchaseResult({@JsonKey(name: 'accessory_id') required this.accessoryId, @JsonKey(name: 'currency_balance') required this.currencyBalance});
  factory _PurchaseResult.fromJson(Map<String, dynamic> json) => _$PurchaseResultFromJson(json);

@override@JsonKey(name: 'accessory_id') final  int accessoryId;
@override@JsonKey(name: 'currency_balance') final  int currencyBalance;

/// Create a copy of PurchaseResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseResultCopyWith<_PurchaseResult> get copyWith => __$PurchaseResultCopyWithImpl<_PurchaseResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurchaseResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseResult&&(identical(other.accessoryId, accessoryId) || other.accessoryId == accessoryId)&&(identical(other.currencyBalance, currencyBalance) || other.currencyBalance == currencyBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,accessoryId,currencyBalance);
}

@override
String toString() {
    return 'PurchaseResult(accessoryId: $accessoryId, currencyBalance: $currencyBalance)';
}


}

/// @nodoc
abstract mixin class _$PurchaseResultCopyWith<$Res> implements $PurchaseResultCopyWith<$Res> {
  factory _$PurchaseResultCopyWith(_PurchaseResult value, $Res Function(_PurchaseResult) _then) = __$PurchaseResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'accessory_id') int accessoryId,@JsonKey(name: 'currency_balance') int currencyBalance
});




}
/// @nodoc
class __$PurchaseResultCopyWithImpl<$Res>
    implements _$PurchaseResultCopyWith<$Res> {
  __$PurchaseResultCopyWithImpl(this._self, this._then);

  final _PurchaseResult _self;
  final $Res Function(_PurchaseResult) _then;

/// Create a copy of PurchaseResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessoryId = null,Object? currencyBalance = null,}) {
  return _then(_PurchaseResult(
accessoryId: null == accessoryId ? _self.accessoryId : accessoryId // ignore: cast_nullable_to_non_nullable
as int,currencyBalance: null == currencyBalance ? _self.currencyBalance : currencyBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GachaResult {

@JsonKey(name: 'accessory_ids') List<int> get accessoryIds;@JsonKey(name: 'currency_spent') int get currencySpent;@JsonKey(name: 'currency_balance') int get currencyBalance;
/// Create a copy of GachaResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GachaResultCopyWith<GachaResult> get copyWith => _$GachaResultCopyWithImpl<GachaResult>(this as GachaResult, _$identity);

  /// Serializes this GachaResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GachaResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GachaResult&&const DeepCollectionEquality().equals(other.accessoryIds, _this.accessoryIds)&&(identical(other.currencySpent, _this.currencySpent) || other.currencySpent == _this.currencySpent)&&(identical(other.currencyBalance, _this.currencyBalance) || other.currencyBalance == _this.currencyBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GachaResult;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.accessoryIds),_this.currencySpent,_this.currencyBalance);
}

@override
String toString() {
  final _this = this as GachaResult;
  return 'GachaResult(accessoryIds: ${_this.accessoryIds}, currencySpent: ${_this.currencySpent}, currencyBalance: ${_this.currencyBalance})';
}


}

/// @nodoc
abstract mixin class $GachaResultCopyWith<$Res>  {
  factory $GachaResultCopyWith(GachaResult value, $Res Function(GachaResult) _then) = _$GachaResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'accessory_ids') List<int> accessoryIds,@JsonKey(name: 'currency_spent') int currencySpent,@JsonKey(name: 'currency_balance') int currencyBalance
});




}
/// @nodoc
class _$GachaResultCopyWithImpl<$Res>
    implements $GachaResultCopyWith<$Res> {
  _$GachaResultCopyWithImpl(this._self, this._then);

  final GachaResult _self;
  final $Res Function(GachaResult) _then;

/// Create a copy of GachaResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessoryIds = null,Object? currencySpent = null,Object? currencyBalance = null,}) {
  return _then(GachaResult(
accessoryIds: null == accessoryIds ? _self.accessoryIds : accessoryIds // ignore: cast_nullable_to_non_nullable
as List<int>,currencySpent: null == currencySpent ? _self.currencySpent : currencySpent // ignore: cast_nullable_to_non_nullable
as int,currencyBalance: null == currencyBalance ? _self.currencyBalance : currencyBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GachaResult].
extension GachaResultPatterns on GachaResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GachaResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GachaResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GachaResult value)  $default,){
final _that = this;
switch (_that) {
case _GachaResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GachaResult value)?  $default,){
final _that = this;
switch (_that) {
case _GachaResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'accessory_ids')  List<int> accessoryIds, @JsonKey(name: 'currency_spent')  int currencySpent, @JsonKey(name: 'currency_balance')  int currencyBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GachaResult() when $default != null:
return $default(_that.accessoryIds,_that.currencySpent,_that.currencyBalance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'accessory_ids')  List<int> accessoryIds, @JsonKey(name: 'currency_spent')  int currencySpent, @JsonKey(name: 'currency_balance')  int currencyBalance)  $default,) {final _that = this;
switch (_that) {
case _GachaResult():
return $default(_that.accessoryIds,_that.currencySpent,_that.currencyBalance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'accessory_ids')  List<int> accessoryIds, @JsonKey(name: 'currency_spent')  int currencySpent, @JsonKey(name: 'currency_balance')  int currencyBalance)?  $default,) {final _that = this;
switch (_that) {
case _GachaResult() when $default != null:
return $default(_that.accessoryIds,_that.currencySpent,_that.currencyBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GachaResult implements GachaResult {
  const _GachaResult({@JsonKey(name: 'accessory_ids') required  List<int> accessoryIds, @JsonKey(name: 'currency_spent') required this.currencySpent, @JsonKey(name: 'currency_balance') required this.currencyBalance}): _accessoryIds = accessoryIds;
  factory _GachaResult.fromJson(Map<String, dynamic> json) => _$GachaResultFromJson(json);

 final  List<int> _accessoryIds;
@override@JsonKey(name: 'accessory_ids') List<int> get accessoryIds {
  if (_accessoryIds is EqualUnmodifiableListView) return _accessoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accessoryIds);
}

@override@JsonKey(name: 'currency_spent') final  int currencySpent;
@override@JsonKey(name: 'currency_balance') final  int currencyBalance;

/// Create a copy of GachaResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GachaResultCopyWith<_GachaResult> get copyWith => __$GachaResultCopyWithImpl<_GachaResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GachaResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GachaResult&&const DeepCollectionEquality().equals(other.accessoryIds, _accessoryIds)&&(identical(other.currencySpent, currencySpent) || other.currencySpent == currencySpent)&&(identical(other.currencyBalance, currencyBalance) || other.currencyBalance == currencyBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_accessoryIds),currencySpent,currencyBalance);
}

@override
String toString() {
    return 'GachaResult(accessoryIds: $accessoryIds, currencySpent: $currencySpent, currencyBalance: $currencyBalance)';
}


}

/// @nodoc
abstract mixin class _$GachaResultCopyWith<$Res> implements $GachaResultCopyWith<$Res> {
  factory _$GachaResultCopyWith(_GachaResult value, $Res Function(_GachaResult) _then) = __$GachaResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'accessory_ids') List<int> accessoryIds,@JsonKey(name: 'currency_spent') int currencySpent,@JsonKey(name: 'currency_balance') int currencyBalance
});




}
/// @nodoc
class __$GachaResultCopyWithImpl<$Res>
    implements _$GachaResultCopyWith<$Res> {
  __$GachaResultCopyWithImpl(this._self, this._then);

  final _GachaResult _self;
  final $Res Function(_GachaResult) _then;

/// Create a copy of GachaResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessoryIds = null,Object? currencySpent = null,Object? currencyBalance = null,}) {
  return _then(_GachaResult(
accessoryIds: null == accessoryIds ? _self._accessoryIds : accessoryIds // ignore: cast_nullable_to_non_nullable
as List<int>,currencySpent: null == currencySpent ? _self.currencySpent : currencySpent // ignore: cast_nullable_to_non_nullable
as int,currencyBalance: null == currencyBalance ? _self.currencyBalance : currencyBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
