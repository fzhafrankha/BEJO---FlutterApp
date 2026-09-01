// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_history_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DayEarning {

 String get date;@JsonKey(name: 'total_earned') int get totalEarned;
/// Create a copy of DayEarning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayEarningCopyWith<DayEarning> get copyWith => _$DayEarningCopyWithImpl<DayEarning>(this as DayEarning, _$identity);

  /// Serializes this DayEarning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DayEarning;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayEarning&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.totalEarned, _this.totalEarned) || other.totalEarned == _this.totalEarned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DayEarning;
  return Object.hash(runtimeType,_this.date,_this.totalEarned);
}

@override
String toString() {
  final _this = this as DayEarning;
  return 'DayEarning(date: ${_this.date}, totalEarned: ${_this.totalEarned})';
}


}

/// @nodoc
abstract mixin class $DayEarningCopyWith<$Res>  {
  factory $DayEarningCopyWith(DayEarning value, $Res Function(DayEarning) _then) = _$DayEarningCopyWithImpl;
@useResult
$Res call({
 String date,@JsonKey(name: 'total_earned') int totalEarned
});




}
/// @nodoc
class _$DayEarningCopyWithImpl<$Res>
    implements $DayEarningCopyWith<$Res> {
  _$DayEarningCopyWithImpl(this._self, this._then);

  final DayEarning _self;
  final $Res Function(DayEarning) _then;

/// Create a copy of DayEarning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? totalEarned = null,}) {
  return _then(DayEarning(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalEarned: null == totalEarned ? _self.totalEarned : totalEarned // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DayEarning].
extension DayEarningPatterns on DayEarning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayEarning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayEarning() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayEarning value)  $default,){
final _that = this;
switch (_that) {
case _DayEarning():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayEarning value)?  $default,){
final _that = this;
switch (_that) {
case _DayEarning() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date, @JsonKey(name: 'total_earned')  int totalEarned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayEarning() when $default != null:
return $default(_that.date,_that.totalEarned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date, @JsonKey(name: 'total_earned')  int totalEarned)  $default,) {final _that = this;
switch (_that) {
case _DayEarning():
return $default(_that.date,_that.totalEarned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date, @JsonKey(name: 'total_earned')  int totalEarned)?  $default,) {final _that = this;
switch (_that) {
case _DayEarning() when $default != null:
return $default(_that.date,_that.totalEarned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DayEarning implements DayEarning {
  const _DayEarning({required this.date, @JsonKey(name: 'total_earned') required this.totalEarned});
  factory _DayEarning.fromJson(Map<String, dynamic> json) => _$DayEarningFromJson(json);

@override final  String date;
@override@JsonKey(name: 'total_earned') final  int totalEarned;

/// Create a copy of DayEarning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayEarningCopyWith<_DayEarning> get copyWith => __$DayEarningCopyWithImpl<_DayEarning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayEarningToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayEarning&&(identical(other.date, date) || other.date == date)&&(identical(other.totalEarned, totalEarned) || other.totalEarned == totalEarned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,totalEarned);
}

@override
String toString() {
    return 'DayEarning(date: $date, totalEarned: $totalEarned)';
}


}

/// @nodoc
abstract mixin class _$DayEarningCopyWith<$Res> implements $DayEarningCopyWith<$Res> {
  factory _$DayEarningCopyWith(_DayEarning value, $Res Function(_DayEarning) _then) = __$DayEarningCopyWithImpl;
@override @useResult
$Res call({
 String date,@JsonKey(name: 'total_earned') int totalEarned
});




}
/// @nodoc
class __$DayEarningCopyWithImpl<$Res>
    implements _$DayEarningCopyWith<$Res> {
  __$DayEarningCopyWithImpl(this._self, this._then);

  final _DayEarning _self;
  final $Res Function(_DayEarning) _then;

/// Create a copy of DayEarning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? totalEarned = null,}) {
  return _then(_DayEarning(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,totalEarned: null == totalEarned ? _self.totalEarned : totalEarned // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WeeklyHistory {

 List<DayEarning> get days;@JsonKey(name: 'total_earned') int get totalEarned;
/// Create a copy of WeeklyHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyHistoryCopyWith<WeeklyHistory> get copyWith => _$WeeklyHistoryCopyWithImpl<WeeklyHistory>(this as WeeklyHistory, _$identity);

  /// Serializes this WeeklyHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WeeklyHistory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyHistory&&const DeepCollectionEquality().equals(other.days, _this.days)&&(identical(other.totalEarned, _this.totalEarned) || other.totalEarned == _this.totalEarned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeeklyHistory;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.days),_this.totalEarned);
}

@override
String toString() {
  final _this = this as WeeklyHistory;
  return 'WeeklyHistory(days: ${_this.days}, totalEarned: ${_this.totalEarned})';
}


}

/// @nodoc
abstract mixin class $WeeklyHistoryCopyWith<$Res>  {
  factory $WeeklyHistoryCopyWith(WeeklyHistory value, $Res Function(WeeklyHistory) _then) = _$WeeklyHistoryCopyWithImpl;
@useResult
$Res call({
 List<DayEarning> days,@JsonKey(name: 'total_earned') int totalEarned
});




}
/// @nodoc
class _$WeeklyHistoryCopyWithImpl<$Res>
    implements $WeeklyHistoryCopyWith<$Res> {
  _$WeeklyHistoryCopyWithImpl(this._self, this._then);

  final WeeklyHistory _self;
  final $Res Function(WeeklyHistory) _then;

/// Create a copy of WeeklyHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? days = null,Object? totalEarned = null,}) {
  return _then(WeeklyHistory(
days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<DayEarning>,totalEarned: null == totalEarned ? _self.totalEarned : totalEarned // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklyHistory].
extension WeeklyHistoryPatterns on WeeklyHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyHistory value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyHistory value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DayEarning> days, @JsonKey(name: 'total_earned')  int totalEarned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyHistory() when $default != null:
return $default(_that.days,_that.totalEarned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DayEarning> days, @JsonKey(name: 'total_earned')  int totalEarned)  $default,) {final _that = this;
switch (_that) {
case _WeeklyHistory():
return $default(_that.days,_that.totalEarned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DayEarning> days, @JsonKey(name: 'total_earned')  int totalEarned)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyHistory() when $default != null:
return $default(_that.days,_that.totalEarned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeeklyHistory implements WeeklyHistory {
  const _WeeklyHistory({required  List<DayEarning> days, @JsonKey(name: 'total_earned') required this.totalEarned}): _days = days;
  factory _WeeklyHistory.fromJson(Map<String, dynamic> json) => _$WeeklyHistoryFromJson(json);

 final  List<DayEarning> _days;
@override List<DayEarning> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

@override@JsonKey(name: 'total_earned') final  int totalEarned;

/// Create a copy of WeeklyHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyHistoryCopyWith<_WeeklyHistory> get copyWith => __$WeeklyHistoryCopyWithImpl<_WeeklyHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeeklyHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyHistory&&const DeepCollectionEquality().equals(other.days, _days)&&(identical(other.totalEarned, totalEarned) || other.totalEarned == totalEarned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_days),totalEarned);
}

@override
String toString() {
    return 'WeeklyHistory(days: $days, totalEarned: $totalEarned)';
}


}

/// @nodoc
abstract mixin class _$WeeklyHistoryCopyWith<$Res> implements $WeeklyHistoryCopyWith<$Res> {
  factory _$WeeklyHistoryCopyWith(_WeeklyHistory value, $Res Function(_WeeklyHistory) _then) = __$WeeklyHistoryCopyWithImpl;
@override @useResult
$Res call({
 List<DayEarning> days,@JsonKey(name: 'total_earned') int totalEarned
});




}
/// @nodoc
class __$WeeklyHistoryCopyWithImpl<$Res>
    implements _$WeeklyHistoryCopyWith<$Res> {
  __$WeeklyHistoryCopyWithImpl(this._self, this._then);

  final _WeeklyHistory _self;
  final $Res Function(_WeeklyHistory) _then;

/// Create a copy of WeeklyHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? days = null,Object? totalEarned = null,}) {
  return _then(_WeeklyHistory(
days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<DayEarning>,totalEarned: null == totalEarned ? _self.totalEarned : totalEarned // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
