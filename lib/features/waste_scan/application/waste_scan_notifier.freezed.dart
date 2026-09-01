// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waste_scan_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WasteScanState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WasteScanState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'WasteScanState()';
}


}

/// @nodoc
class $WasteScanStateCopyWith<$Res>  {
$WasteScanStateCopyWith(WasteScanState _, $Res Function(WasteScanState) __);
}


/// Adds pattern-matching-related methods to [WasteScanState].
extension WasteScanStatePatterns on WasteScanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Incomplete value)?  incomplete,TResult Function( _PreviewMismatch value)?  previewMismatch,TResult Function( _PreviewMatch value)?  previewMatch,TResult Function( _Submitting value)?  submitting,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Incomplete() when incomplete != null:
return incomplete(_that);case _PreviewMismatch() when previewMismatch != null:
return previewMismatch(_that);case _PreviewMatch() when previewMatch != null:
return previewMatch(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Incomplete value)  incomplete,required TResult Function( _PreviewMismatch value)  previewMismatch,required TResult Function( _PreviewMatch value)  previewMatch,required TResult Function( _Submitting value)  submitting,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Incomplete():
return incomplete(_that);case _PreviewMismatch():
return previewMismatch(_that);case _PreviewMatch():
return previewMatch(_that);case _Submitting():
return submitting(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Incomplete value)?  incomplete,TResult? Function( _PreviewMismatch value)?  previewMismatch,TResult? Function( _PreviewMatch value)?  previewMatch,TResult? Function( _Submitting value)?  submitting,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Incomplete() when incomplete != null:
return incomplete(_that);case _PreviewMismatch() when previewMismatch != null:
return previewMismatch(_that);case _PreviewMatch() when previewMatch != null:
return previewMatch(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  incomplete,TResult Function( WasteClass trashClass)?  previewMismatch,TResult Function( WasteClass trashClass,  double confidence)?  previewMatch,TResult Function()?  submitting,TResult Function( WasteScanResult result)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Incomplete() when incomplete != null:
return incomplete();case _PreviewMismatch() when previewMismatch != null:
return previewMismatch(_that.trashClass);case _PreviewMatch() when previewMatch != null:
return previewMatch(_that.trashClass,_that.confidence);case _Submitting() when submitting != null:
return submitting();case _Success() when success != null:
return success(_that.result);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  incomplete,required TResult Function( WasteClass trashClass)  previewMismatch,required TResult Function( WasteClass trashClass,  double confidence)  previewMatch,required TResult Function()  submitting,required TResult Function( WasteScanResult result)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Incomplete():
return incomplete();case _PreviewMismatch():
return previewMismatch(_that.trashClass);case _PreviewMatch():
return previewMatch(_that.trashClass,_that.confidence);case _Submitting():
return submitting();case _Success():
return success(_that.result);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  incomplete,TResult? Function( WasteClass trashClass)?  previewMismatch,TResult? Function( WasteClass trashClass,  double confidence)?  previewMatch,TResult? Function()?  submitting,TResult? Function( WasteScanResult result)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Incomplete() when incomplete != null:
return incomplete();case _PreviewMismatch() when previewMismatch != null:
return previewMismatch(_that.trashClass);case _PreviewMatch() when previewMatch != null:
return previewMatch(_that.trashClass,_that.confidence);case _Submitting() when submitting != null:
return submitting();case _Success() when success != null:
return success(_that.result);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements WasteScanState {
  const _Idle();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'WasteScanState.idle()';
}


}




/// @nodoc


class _Incomplete implements WasteScanState {
  const _Incomplete();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Incomplete);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'WasteScanState.incomplete()';
}


}




/// @nodoc


class _PreviewMismatch implements WasteScanState {
  const _PreviewMismatch({required this.trashClass});
  

 final  WasteClass trashClass;

/// Create a copy of WasteScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreviewMismatchCopyWith<_PreviewMismatch> get copyWith => __$PreviewMismatchCopyWithImpl<_PreviewMismatch>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviewMismatch&&(identical(other.trashClass, trashClass) || other.trashClass == trashClass));
}


@override
int get hashCode {
    return Object.hash(runtimeType,trashClass);
}

@override
String toString() {
    return 'WasteScanState.previewMismatch(trashClass: $trashClass)';
}


}

/// @nodoc
abstract mixin class _$PreviewMismatchCopyWith<$Res> implements $WasteScanStateCopyWith<$Res> {
  factory _$PreviewMismatchCopyWith(_PreviewMismatch value, $Res Function(_PreviewMismatch) _then) = __$PreviewMismatchCopyWithImpl;
@useResult
$Res call({
 WasteClass trashClass
});




}
/// @nodoc
class __$PreviewMismatchCopyWithImpl<$Res>
    implements _$PreviewMismatchCopyWith<$Res> {
  __$PreviewMismatchCopyWithImpl(this._self, this._then);

  final _PreviewMismatch _self;
  final $Res Function(_PreviewMismatch) _then;

/// Create a copy of WasteScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trashClass = null,}) {
  return _then(_PreviewMismatch(
trashClass: null == trashClass ? _self.trashClass : trashClass // ignore: cast_nullable_to_non_nullable
as WasteClass,
  ));
}


}

/// @nodoc


class _PreviewMatch implements WasteScanState {
  const _PreviewMatch({required this.trashClass, required this.confidence});
  

 final  WasteClass trashClass;
 final  double confidence;

/// Create a copy of WasteScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreviewMatchCopyWith<_PreviewMatch> get copyWith => __$PreviewMatchCopyWithImpl<_PreviewMatch>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviewMatch&&(identical(other.trashClass, trashClass) || other.trashClass == trashClass)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}


@override
int get hashCode {
    return Object.hash(runtimeType,trashClass,confidence);
}

@override
String toString() {
    return 'WasteScanState.previewMatch(trashClass: $trashClass, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class _$PreviewMatchCopyWith<$Res> implements $WasteScanStateCopyWith<$Res> {
  factory _$PreviewMatchCopyWith(_PreviewMatch value, $Res Function(_PreviewMatch) _then) = __$PreviewMatchCopyWithImpl;
@useResult
$Res call({
 WasteClass trashClass, double confidence
});




}
/// @nodoc
class __$PreviewMatchCopyWithImpl<$Res>
    implements _$PreviewMatchCopyWith<$Res> {
  __$PreviewMatchCopyWithImpl(this._self, this._then);

  final _PreviewMatch _self;
  final $Res Function(_PreviewMatch) _then;

/// Create a copy of WasteScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trashClass = null,Object? confidence = null,}) {
  return _then(_PreviewMatch(
trashClass: null == trashClass ? _self.trashClass : trashClass // ignore: cast_nullable_to_non_nullable
as WasteClass,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Submitting implements WasteScanState {
  const _Submitting();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'WasteScanState.submitting()';
}


}




/// @nodoc


class _Success implements WasteScanState {
  const _Success(this.result);
  

 final  WasteScanResult result;

/// Create a copy of WasteScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode {
    return Object.hash(runtimeType,result);
}

@override
String toString() {
    return 'WasteScanState.success(result: $result)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $WasteScanStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 WasteScanResult result
});


$WasteScanResultCopyWith<$Res> get result;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of WasteScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(_Success(
null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as WasteScanResult,
  ));
}

/// Create a copy of WasteScanState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WasteScanResultCopyWith<$Res> get result {
  
  return $WasteScanResultCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

/// @nodoc


class _Error implements WasteScanState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of WasteScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'WasteScanState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $WasteScanStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of WasteScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
