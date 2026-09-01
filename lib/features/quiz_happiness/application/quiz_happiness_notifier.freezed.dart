// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_happiness_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizHappinessState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizHappinessState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'QuizHappinessState()';
}


}

/// @nodoc
class $QuizHappinessStateCopyWith<$Res>  {
$QuizHappinessStateCopyWith(QuizHappinessState _, $Res Function(QuizHappinessState) __);
}


/// Adds pattern-matching-related methods to [QuizHappinessState].
extension QuizHappinessStatePatterns on QuizHappinessState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _InProgress value)?  inProgress,TResult Function( _Finished value)?  finished,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Finished() when finished != null:
return finished(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _InProgress value)  inProgress,required TResult Function( _Finished value)  finished,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Error():
return error(_that);case _InProgress():
return inProgress(_that);case _Finished():
return finished(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _InProgress value)?  inProgress,TResult? Function( _Finished value)?  finished,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Finished() when finished != null:
return finished(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( List<QuizQuestion> questions,  int currentIndex,  bool? lastAnswerCorrect)?  inProgress,TResult Function( int happiness)?  finished,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _InProgress() when inProgress != null:
return inProgress(_that.questions,_that.currentIndex,_that.lastAnswerCorrect);case _Finished() when finished != null:
return finished(_that.happiness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( List<QuizQuestion> questions,  int currentIndex,  bool? lastAnswerCorrect)  inProgress,required TResult Function( int happiness)  finished,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Error():
return error(_that.message);case _InProgress():
return inProgress(_that.questions,_that.currentIndex,_that.lastAnswerCorrect);case _Finished():
return finished(_that.happiness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( List<QuizQuestion> questions,  int currentIndex,  bool? lastAnswerCorrect)?  inProgress,TResult? Function( int happiness)?  finished,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _InProgress() when inProgress != null:
return inProgress(_that.questions,_that.currentIndex,_that.lastAnswerCorrect);case _Finished() when finished != null:
return finished(_that.happiness);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements QuizHappinessState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'QuizHappinessState.loading()';
}


}




/// @nodoc


class _Error implements QuizHappinessState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of QuizHappinessState
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
    return 'QuizHappinessState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $QuizHappinessStateCopyWith<$Res> {
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

/// Create a copy of QuizHappinessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _InProgress implements QuizHappinessState {
  const _InProgress({required  List<QuizQuestion> questions, required this.currentIndex, this.lastAnswerCorrect}): _questions = questions;
  

 final  List<QuizQuestion> _questions;
 List<QuizQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  int currentIndex;
 final  bool? lastAnswerCorrect;

/// Create a copy of QuizHappinessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InProgressCopyWith<_InProgress> get copyWith => __$InProgressCopyWithImpl<_InProgress>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgress&&const DeepCollectionEquality().equals(other.questions, _questions)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.lastAnswerCorrect, lastAnswerCorrect) || other.lastAnswerCorrect == lastAnswerCorrect));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions),currentIndex,lastAnswerCorrect);
}

@override
String toString() {
    return 'QuizHappinessState.inProgress(questions: $questions, currentIndex: $currentIndex, lastAnswerCorrect: $lastAnswerCorrect)';
}


}

/// @nodoc
abstract mixin class _$InProgressCopyWith<$Res> implements $QuizHappinessStateCopyWith<$Res> {
  factory _$InProgressCopyWith(_InProgress value, $Res Function(_InProgress) _then) = __$InProgressCopyWithImpl;
@useResult
$Res call({
 List<QuizQuestion> questions, int currentIndex, bool? lastAnswerCorrect
});




}
/// @nodoc
class __$InProgressCopyWithImpl<$Res>
    implements _$InProgressCopyWith<$Res> {
  __$InProgressCopyWithImpl(this._self, this._then);

  final _InProgress _self;
  final $Res Function(_InProgress) _then;

/// Create a copy of QuizHappinessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? questions = null,Object? currentIndex = null,Object? lastAnswerCorrect = freezed,}) {
  return _then(_InProgress(
questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuizQuestion>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,lastAnswerCorrect: freezed == lastAnswerCorrect ? _self.lastAnswerCorrect : lastAnswerCorrect // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class _Finished implements QuizHappinessState {
  const _Finished({required this.happiness});
  

 final  int happiness;

/// Create a copy of QuizHappinessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinishedCopyWith<_Finished> get copyWith => __$FinishedCopyWithImpl<_Finished>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Finished&&(identical(other.happiness, happiness) || other.happiness == happiness));
}


@override
int get hashCode {
    return Object.hash(runtimeType,happiness);
}

@override
String toString() {
    return 'QuizHappinessState.finished(happiness: $happiness)';
}


}

/// @nodoc
abstract mixin class _$FinishedCopyWith<$Res> implements $QuizHappinessStateCopyWith<$Res> {
  factory _$FinishedCopyWith(_Finished value, $Res Function(_Finished) _then) = __$FinishedCopyWithImpl;
@useResult
$Res call({
 int happiness
});




}
/// @nodoc
class __$FinishedCopyWithImpl<$Res>
    implements _$FinishedCopyWith<$Res> {
  __$FinishedCopyWithImpl(this._self, this._then);

  final _Finished _self;
  final $Res Function(_Finished) _then;

/// Create a copy of QuizHappinessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? happiness = null,}) {
  return _then(_Finished(
happiness: null == happiness ? _self.happiness : happiness // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
