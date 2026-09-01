// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waste_scan_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WasteScanSubmitRequest {

@JsonKey(name: 'classified_label') String get classifiedLabel; double? get confidence;
/// Create a copy of WasteScanSubmitRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WasteScanSubmitRequestCopyWith<WasteScanSubmitRequest> get copyWith => _$WasteScanSubmitRequestCopyWithImpl<WasteScanSubmitRequest>(this as WasteScanSubmitRequest, _$identity);

  /// Serializes this WasteScanSubmitRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WasteScanSubmitRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WasteScanSubmitRequest&&(identical(other.classifiedLabel, _this.classifiedLabel) || other.classifiedLabel == _this.classifiedLabel)&&(identical(other.confidence, _this.confidence) || other.confidence == _this.confidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WasteScanSubmitRequest;
  return Object.hash(runtimeType,_this.classifiedLabel,_this.confidence);
}

@override
String toString() {
  final _this = this as WasteScanSubmitRequest;
  return 'WasteScanSubmitRequest(classifiedLabel: ${_this.classifiedLabel}, confidence: ${_this.confidence})';
}


}

/// @nodoc
abstract mixin class $WasteScanSubmitRequestCopyWith<$Res>  {
  factory $WasteScanSubmitRequestCopyWith(WasteScanSubmitRequest value, $Res Function(WasteScanSubmitRequest) _then) = _$WasteScanSubmitRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'classified_label') String classifiedLabel, double? confidence
});




}
/// @nodoc
class _$WasteScanSubmitRequestCopyWithImpl<$Res>
    implements $WasteScanSubmitRequestCopyWith<$Res> {
  _$WasteScanSubmitRequestCopyWithImpl(this._self, this._then);

  final WasteScanSubmitRequest _self;
  final $Res Function(WasteScanSubmitRequest) _then;

/// Create a copy of WasteScanSubmitRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? classifiedLabel = null,Object? confidence = freezed,}) {
  return _then(WasteScanSubmitRequest(
classifiedLabel: null == classifiedLabel ? _self.classifiedLabel : classifiedLabel // ignore: cast_nullable_to_non_nullable
as String,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [WasteScanSubmitRequest].
extension WasteScanSubmitRequestPatterns on WasteScanSubmitRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WasteScanSubmitRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WasteScanSubmitRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WasteScanSubmitRequest value)  $default,){
final _that = this;
switch (_that) {
case _WasteScanSubmitRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WasteScanSubmitRequest value)?  $default,){
final _that = this;
switch (_that) {
case _WasteScanSubmitRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'classified_label')  String classifiedLabel,  double? confidence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WasteScanSubmitRequest() when $default != null:
return $default(_that.classifiedLabel,_that.confidence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'classified_label')  String classifiedLabel,  double? confidence)  $default,) {final _that = this;
switch (_that) {
case _WasteScanSubmitRequest():
return $default(_that.classifiedLabel,_that.confidence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'classified_label')  String classifiedLabel,  double? confidence)?  $default,) {final _that = this;
switch (_that) {
case _WasteScanSubmitRequest() when $default != null:
return $default(_that.classifiedLabel,_that.confidence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WasteScanSubmitRequest implements WasteScanSubmitRequest {
  const _WasteScanSubmitRequest({@JsonKey(name: 'classified_label') required this.classifiedLabel, this.confidence});
  factory _WasteScanSubmitRequest.fromJson(Map<String, dynamic> json) => _$WasteScanSubmitRequestFromJson(json);

@override@JsonKey(name: 'classified_label') final  String classifiedLabel;
@override final  double? confidence;

/// Create a copy of WasteScanSubmitRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WasteScanSubmitRequestCopyWith<_WasteScanSubmitRequest> get copyWith => __$WasteScanSubmitRequestCopyWithImpl<_WasteScanSubmitRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WasteScanSubmitRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WasteScanSubmitRequest&&(identical(other.classifiedLabel, classifiedLabel) || other.classifiedLabel == classifiedLabel)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,classifiedLabel,confidence);
}

@override
String toString() {
    return 'WasteScanSubmitRequest(classifiedLabel: $classifiedLabel, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class _$WasteScanSubmitRequestCopyWith<$Res> implements $WasteScanSubmitRequestCopyWith<$Res> {
  factory _$WasteScanSubmitRequestCopyWith(_WasteScanSubmitRequest value, $Res Function(_WasteScanSubmitRequest) _then) = __$WasteScanSubmitRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'classified_label') String classifiedLabel, double? confidence
});




}
/// @nodoc
class __$WasteScanSubmitRequestCopyWithImpl<$Res>
    implements _$WasteScanSubmitRequestCopyWith<$Res> {
  __$WasteScanSubmitRequestCopyWithImpl(this._self, this._then);

  final _WasteScanSubmitRequest _self;
  final $Res Function(_WasteScanSubmitRequest) _then;

/// Create a copy of WasteScanSubmitRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? classifiedLabel = null,Object? confidence = freezed,}) {
  return _then(_WasteScanSubmitRequest(
classifiedLabel: null == classifiedLabel ? _self.classifiedLabel : classifiedLabel // ignore: cast_nullable_to_non_nullable
as String,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$WasteScanResult {

@JsonKey(name: 'currency_awarded') int get currencyAwarded;@JsonKey(name: 'currency_balance') int get currencyBalance;
/// Create a copy of WasteScanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WasteScanResultCopyWith<WasteScanResult> get copyWith => _$WasteScanResultCopyWithImpl<WasteScanResult>(this as WasteScanResult, _$identity);

  /// Serializes this WasteScanResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WasteScanResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WasteScanResult&&(identical(other.currencyAwarded, _this.currencyAwarded) || other.currencyAwarded == _this.currencyAwarded)&&(identical(other.currencyBalance, _this.currencyBalance) || other.currencyBalance == _this.currencyBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WasteScanResult;
  return Object.hash(runtimeType,_this.currencyAwarded,_this.currencyBalance);
}

@override
String toString() {
  final _this = this as WasteScanResult;
  return 'WasteScanResult(currencyAwarded: ${_this.currencyAwarded}, currencyBalance: ${_this.currencyBalance})';
}


}

/// @nodoc
abstract mixin class $WasteScanResultCopyWith<$Res>  {
  factory $WasteScanResultCopyWith(WasteScanResult value, $Res Function(WasteScanResult) _then) = _$WasteScanResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'currency_awarded') int currencyAwarded,@JsonKey(name: 'currency_balance') int currencyBalance
});




}
/// @nodoc
class _$WasteScanResultCopyWithImpl<$Res>
    implements $WasteScanResultCopyWith<$Res> {
  _$WasteScanResultCopyWithImpl(this._self, this._then);

  final WasteScanResult _self;
  final $Res Function(WasteScanResult) _then;

/// Create a copy of WasteScanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currencyAwarded = null,Object? currencyBalance = null,}) {
  return _then(WasteScanResult(
currencyAwarded: null == currencyAwarded ? _self.currencyAwarded : currencyAwarded // ignore: cast_nullable_to_non_nullable
as int,currencyBalance: null == currencyBalance ? _self.currencyBalance : currencyBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WasteScanResult].
extension WasteScanResultPatterns on WasteScanResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WasteScanResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WasteScanResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WasteScanResult value)  $default,){
final _that = this;
switch (_that) {
case _WasteScanResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WasteScanResult value)?  $default,){
final _that = this;
switch (_that) {
case _WasteScanResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'currency_awarded')  int currencyAwarded, @JsonKey(name: 'currency_balance')  int currencyBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WasteScanResult() when $default != null:
return $default(_that.currencyAwarded,_that.currencyBalance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'currency_awarded')  int currencyAwarded, @JsonKey(name: 'currency_balance')  int currencyBalance)  $default,) {final _that = this;
switch (_that) {
case _WasteScanResult():
return $default(_that.currencyAwarded,_that.currencyBalance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'currency_awarded')  int currencyAwarded, @JsonKey(name: 'currency_balance')  int currencyBalance)?  $default,) {final _that = this;
switch (_that) {
case _WasteScanResult() when $default != null:
return $default(_that.currencyAwarded,_that.currencyBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WasteScanResult implements WasteScanResult {
  const _WasteScanResult({@JsonKey(name: 'currency_awarded') required this.currencyAwarded, @JsonKey(name: 'currency_balance') required this.currencyBalance});
  factory _WasteScanResult.fromJson(Map<String, dynamic> json) => _$WasteScanResultFromJson(json);

@override@JsonKey(name: 'currency_awarded') final  int currencyAwarded;
@override@JsonKey(name: 'currency_balance') final  int currencyBalance;

/// Create a copy of WasteScanResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WasteScanResultCopyWith<_WasteScanResult> get copyWith => __$WasteScanResultCopyWithImpl<_WasteScanResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WasteScanResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WasteScanResult&&(identical(other.currencyAwarded, currencyAwarded) || other.currencyAwarded == currencyAwarded)&&(identical(other.currencyBalance, currencyBalance) || other.currencyBalance == currencyBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currencyAwarded,currencyBalance);
}

@override
String toString() {
    return 'WasteScanResult(currencyAwarded: $currencyAwarded, currencyBalance: $currencyBalance)';
}


}

/// @nodoc
abstract mixin class _$WasteScanResultCopyWith<$Res> implements $WasteScanResultCopyWith<$Res> {
  factory _$WasteScanResultCopyWith(_WasteScanResult value, $Res Function(_WasteScanResult) _then) = __$WasteScanResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'currency_awarded') int currencyAwarded,@JsonKey(name: 'currency_balance') int currencyBalance
});




}
/// @nodoc
class __$WasteScanResultCopyWithImpl<$Res>
    implements _$WasteScanResultCopyWith<$Res> {
  __$WasteScanResultCopyWithImpl(this._self, this._then);

  final _WasteScanResult _self;
  final $Res Function(_WasteScanResult) _then;

/// Create a copy of WasteScanResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currencyAwarded = null,Object? currencyBalance = null,}) {
  return _then(_WasteScanResult(
currencyAwarded: null == currencyAwarded ? _self.currencyAwarded : currencyAwarded // ignore: cast_nullable_to_non_nullable
as int,currencyBalance: null == currencyBalance ? _self.currencyBalance : currencyBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
