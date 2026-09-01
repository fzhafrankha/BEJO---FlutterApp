// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tamagotchi_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EquippedAccessory {

 int get id; String get name;@JsonKey(fromJson: accessorySlotFromJson, toJson: accessorySlotToJson) AccessorySlot get slot;
/// Create a copy of EquippedAccessory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquippedAccessoryCopyWith<EquippedAccessory> get copyWith => _$EquippedAccessoryCopyWithImpl<EquippedAccessory>(this as EquippedAccessory, _$identity);

  /// Serializes this EquippedAccessory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EquippedAccessory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquippedAccessory&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.slot, _this.slot) || other.slot == _this.slot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EquippedAccessory;
  return Object.hash(runtimeType,_this.id,_this.name,_this.slot);
}

@override
String toString() {
  final _this = this as EquippedAccessory;
  return 'EquippedAccessory(id: ${_this.id}, name: ${_this.name}, slot: ${_this.slot})';
}


}

/// @nodoc
abstract mixin class $EquippedAccessoryCopyWith<$Res>  {
  factory $EquippedAccessoryCopyWith(EquippedAccessory value, $Res Function(EquippedAccessory) _then) = _$EquippedAccessoryCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(fromJson: accessorySlotFromJson, toJson: accessorySlotToJson) AccessorySlot slot
});




}
/// @nodoc
class _$EquippedAccessoryCopyWithImpl<$Res>
    implements $EquippedAccessoryCopyWith<$Res> {
  _$EquippedAccessoryCopyWithImpl(this._self, this._then);

  final EquippedAccessory _self;
  final $Res Function(EquippedAccessory) _then;

/// Create a copy of EquippedAccessory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slot = null,}) {
  return _then(EquippedAccessory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as AccessorySlot,
  ));
}

}


/// Adds pattern-matching-related methods to [EquippedAccessory].
extension EquippedAccessoryPatterns on EquippedAccessory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EquippedAccessory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EquippedAccessory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EquippedAccessory value)  $default,){
final _that = this;
switch (_that) {
case _EquippedAccessory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EquippedAccessory value)?  $default,){
final _that = this;
switch (_that) {
case _EquippedAccessory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(fromJson: accessorySlotFromJson, toJson: accessorySlotToJson)  AccessorySlot slot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EquippedAccessory() when $default != null:
return $default(_that.id,_that.name,_that.slot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(fromJson: accessorySlotFromJson, toJson: accessorySlotToJson)  AccessorySlot slot)  $default,) {final _that = this;
switch (_that) {
case _EquippedAccessory():
return $default(_that.id,_that.name,_that.slot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(fromJson: accessorySlotFromJson, toJson: accessorySlotToJson)  AccessorySlot slot)?  $default,) {final _that = this;
switch (_that) {
case _EquippedAccessory() when $default != null:
return $default(_that.id,_that.name,_that.slot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EquippedAccessory implements EquippedAccessory {
  const _EquippedAccessory({required this.id, required this.name, @JsonKey(fromJson: accessorySlotFromJson, toJson: accessorySlotToJson) required this.slot});
  factory _EquippedAccessory.fromJson(Map<String, dynamic> json) => _$EquippedAccessoryFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(fromJson: accessorySlotFromJson, toJson: accessorySlotToJson) final  AccessorySlot slot;

/// Create a copy of EquippedAccessory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EquippedAccessoryCopyWith<_EquippedAccessory> get copyWith => __$EquippedAccessoryCopyWithImpl<_EquippedAccessory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EquippedAccessoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EquippedAccessory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slot, slot) || other.slot == slot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,slot);
}

@override
String toString() {
    return 'EquippedAccessory(id: $id, name: $name, slot: $slot)';
}


}

/// @nodoc
abstract mixin class _$EquippedAccessoryCopyWith<$Res> implements $EquippedAccessoryCopyWith<$Res> {
  factory _$EquippedAccessoryCopyWith(_EquippedAccessory value, $Res Function(_EquippedAccessory) _then) = __$EquippedAccessoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(fromJson: accessorySlotFromJson, toJson: accessorySlotToJson) AccessorySlot slot
});




}
/// @nodoc
class __$EquippedAccessoryCopyWithImpl<$Res>
    implements _$EquippedAccessoryCopyWith<$Res> {
  __$EquippedAccessoryCopyWithImpl(this._self, this._then);

  final _EquippedAccessory _self;
  final $Res Function(_EquippedAccessory) _then;

/// Create a copy of EquippedAccessory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slot = null,}) {
  return _then(_EquippedAccessory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as AccessorySlot,
  ));
}


}


/// @nodoc
mixin _$Tamagotchi {

 int get happiness;@JsonKey(name: 'growth_stage') int get growthStage;@JsonKey(name: 'last_fed_at') DateTime? get lastFedAt;@JsonKey(name: 'equipped_accessories') List<EquippedAccessory> get equippedAccessories;
/// Create a copy of Tamagotchi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TamagotchiCopyWith<Tamagotchi> get copyWith => _$TamagotchiCopyWithImpl<Tamagotchi>(this as Tamagotchi, _$identity);

  /// Serializes this Tamagotchi to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Tamagotchi;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tamagotchi&&(identical(other.happiness, _this.happiness) || other.happiness == _this.happiness)&&(identical(other.growthStage, _this.growthStage) || other.growthStage == _this.growthStage)&&(identical(other.lastFedAt, _this.lastFedAt) || other.lastFedAt == _this.lastFedAt)&&const DeepCollectionEquality().equals(other.equippedAccessories, _this.equippedAccessories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Tamagotchi;
  return Object.hash(runtimeType,_this.happiness,_this.growthStage,_this.lastFedAt,const DeepCollectionEquality().hash(_this.equippedAccessories));
}

@override
String toString() {
  final _this = this as Tamagotchi;
  return 'Tamagotchi(happiness: ${_this.happiness}, growthStage: ${_this.growthStage}, lastFedAt: ${_this.lastFedAt}, equippedAccessories: ${_this.equippedAccessories})';
}


}

/// @nodoc
abstract mixin class $TamagotchiCopyWith<$Res>  {
  factory $TamagotchiCopyWith(Tamagotchi value, $Res Function(Tamagotchi) _then) = _$TamagotchiCopyWithImpl;
@useResult
$Res call({
 int happiness,@JsonKey(name: 'growth_stage') int growthStage,@JsonKey(name: 'last_fed_at') DateTime? lastFedAt,@JsonKey(name: 'equipped_accessories') List<EquippedAccessory> equippedAccessories
});




}
/// @nodoc
class _$TamagotchiCopyWithImpl<$Res>
    implements $TamagotchiCopyWith<$Res> {
  _$TamagotchiCopyWithImpl(this._self, this._then);

  final Tamagotchi _self;
  final $Res Function(Tamagotchi) _then;

/// Create a copy of Tamagotchi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? happiness = null,Object? growthStage = null,Object? lastFedAt = freezed,Object? equippedAccessories = null,}) {
  return _then(Tamagotchi(
happiness: null == happiness ? _self.happiness : happiness // ignore: cast_nullable_to_non_nullable
as int,growthStage: null == growthStage ? _self.growthStage : growthStage // ignore: cast_nullable_to_non_nullable
as int,lastFedAt: freezed == lastFedAt ? _self.lastFedAt : lastFedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,equippedAccessories: null == equippedAccessories ? _self.equippedAccessories : equippedAccessories // ignore: cast_nullable_to_non_nullable
as List<EquippedAccessory>,
  ));
}

}


/// Adds pattern-matching-related methods to [Tamagotchi].
extension TamagotchiPatterns on Tamagotchi {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tamagotchi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tamagotchi() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tamagotchi value)  $default,){
final _that = this;
switch (_that) {
case _Tamagotchi():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tamagotchi value)?  $default,){
final _that = this;
switch (_that) {
case _Tamagotchi() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int happiness, @JsonKey(name: 'growth_stage')  int growthStage, @JsonKey(name: 'last_fed_at')  DateTime? lastFedAt, @JsonKey(name: 'equipped_accessories')  List<EquippedAccessory> equippedAccessories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tamagotchi() when $default != null:
return $default(_that.happiness,_that.growthStage,_that.lastFedAt,_that.equippedAccessories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int happiness, @JsonKey(name: 'growth_stage')  int growthStage, @JsonKey(name: 'last_fed_at')  DateTime? lastFedAt, @JsonKey(name: 'equipped_accessories')  List<EquippedAccessory> equippedAccessories)  $default,) {final _that = this;
switch (_that) {
case _Tamagotchi():
return $default(_that.happiness,_that.growthStage,_that.lastFedAt,_that.equippedAccessories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int happiness, @JsonKey(name: 'growth_stage')  int growthStage, @JsonKey(name: 'last_fed_at')  DateTime? lastFedAt, @JsonKey(name: 'equipped_accessories')  List<EquippedAccessory> equippedAccessories)?  $default,) {final _that = this;
switch (_that) {
case _Tamagotchi() when $default != null:
return $default(_that.happiness,_that.growthStage,_that.lastFedAt,_that.equippedAccessories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tamagotchi implements Tamagotchi {
  const _Tamagotchi({required this.happiness, @JsonKey(name: 'growth_stage') required this.growthStage, @JsonKey(name: 'last_fed_at') this.lastFedAt, @JsonKey(name: 'equipped_accessories') required  List<EquippedAccessory> equippedAccessories}): _equippedAccessories = equippedAccessories;
  factory _Tamagotchi.fromJson(Map<String, dynamic> json) => _$TamagotchiFromJson(json);

@override final  int happiness;
@override@JsonKey(name: 'growth_stage') final  int growthStage;
@override@JsonKey(name: 'last_fed_at') final  DateTime? lastFedAt;
 final  List<EquippedAccessory> _equippedAccessories;
@override@JsonKey(name: 'equipped_accessories') List<EquippedAccessory> get equippedAccessories {
  if (_equippedAccessories is EqualUnmodifiableListView) return _equippedAccessories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_equippedAccessories);
}


/// Create a copy of Tamagotchi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TamagotchiCopyWith<_Tamagotchi> get copyWith => __$TamagotchiCopyWithImpl<_Tamagotchi>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TamagotchiToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tamagotchi&&(identical(other.happiness, happiness) || other.happiness == happiness)&&(identical(other.growthStage, growthStage) || other.growthStage == growthStage)&&(identical(other.lastFedAt, lastFedAt) || other.lastFedAt == lastFedAt)&&const DeepCollectionEquality().equals(other.equippedAccessories, _equippedAccessories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,happiness,growthStage,lastFedAt,const DeepCollectionEquality().hash(_equippedAccessories));
}

@override
String toString() {
    return 'Tamagotchi(happiness: $happiness, growthStage: $growthStage, lastFedAt: $lastFedAt, equippedAccessories: $equippedAccessories)';
}


}

/// @nodoc
abstract mixin class _$TamagotchiCopyWith<$Res> implements $TamagotchiCopyWith<$Res> {
  factory _$TamagotchiCopyWith(_Tamagotchi value, $Res Function(_Tamagotchi) _then) = __$TamagotchiCopyWithImpl;
@override @useResult
$Res call({
 int happiness,@JsonKey(name: 'growth_stage') int growthStage,@JsonKey(name: 'last_fed_at') DateTime? lastFedAt,@JsonKey(name: 'equipped_accessories') List<EquippedAccessory> equippedAccessories
});




}
/// @nodoc
class __$TamagotchiCopyWithImpl<$Res>
    implements _$TamagotchiCopyWith<$Res> {
  __$TamagotchiCopyWithImpl(this._self, this._then);

  final _Tamagotchi _self;
  final $Res Function(_Tamagotchi) _then;

/// Create a copy of Tamagotchi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? happiness = null,Object? growthStage = null,Object? lastFedAt = freezed,Object? equippedAccessories = null,}) {
  return _then(_Tamagotchi(
happiness: null == happiness ? _self.happiness : happiness // ignore: cast_nullable_to_non_nullable
as int,growthStage: null == growthStage ? _self.growthStage : growthStage // ignore: cast_nullable_to_non_nullable
as int,lastFedAt: freezed == lastFedAt ? _self.lastFedAt : lastFedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,equippedAccessories: null == equippedAccessories ? _self._equippedAccessories : equippedAccessories // ignore: cast_nullable_to_non_nullable
as List<EquippedAccessory>,
  ));
}


}

// dart format on
