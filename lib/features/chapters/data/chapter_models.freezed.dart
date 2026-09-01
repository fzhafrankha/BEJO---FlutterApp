// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chapter {

 int get id; String get title;@JsonKey(name: 'order_index') int get orderIndex;@JsonKey(name: 'reward_currency') int get rewardCurrency;@JsonKey(name: 'is_unlocked') bool get isUnlocked;@JsonKey(name: 'is_completed') bool get isCompleted;@JsonKey(name: 'reward_claimed') bool get rewardClaimed;
/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterCopyWith<Chapter> get copyWith => _$ChapterCopyWithImpl<Chapter>(this as Chapter, _$identity);

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Chapter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chapter&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.orderIndex, _this.orderIndex) || other.orderIndex == _this.orderIndex)&&(identical(other.rewardCurrency, _this.rewardCurrency) || other.rewardCurrency == _this.rewardCurrency)&&(identical(other.isUnlocked, _this.isUnlocked) || other.isUnlocked == _this.isUnlocked)&&(identical(other.isCompleted, _this.isCompleted) || other.isCompleted == _this.isCompleted)&&(identical(other.rewardClaimed, _this.rewardClaimed) || other.rewardClaimed == _this.rewardClaimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Chapter;
  return Object.hash(runtimeType,_this.id,_this.title,_this.orderIndex,_this.rewardCurrency,_this.isUnlocked,_this.isCompleted,_this.rewardClaimed);
}

@override
String toString() {
  final _this = this as Chapter;
  return 'Chapter(id: ${_this.id}, title: ${_this.title}, orderIndex: ${_this.orderIndex}, rewardCurrency: ${_this.rewardCurrency}, isUnlocked: ${_this.isUnlocked}, isCompleted: ${_this.isCompleted}, rewardClaimed: ${_this.rewardClaimed})';
}


}

/// @nodoc
abstract mixin class $ChapterCopyWith<$Res>  {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) _then) = _$ChapterCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'order_index') int orderIndex,@JsonKey(name: 'reward_currency') int rewardCurrency,@JsonKey(name: 'is_unlocked') bool isUnlocked,@JsonKey(name: 'is_completed') bool isCompleted,@JsonKey(name: 'reward_claimed') bool rewardClaimed
});




}
/// @nodoc
class _$ChapterCopyWithImpl<$Res>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._self, this._then);

  final Chapter _self;
  final $Res Function(Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? orderIndex = null,Object? rewardCurrency = null,Object? isUnlocked = null,Object? isCompleted = null,Object? rewardClaimed = null,}) {
  return _then(Chapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,rewardCurrency: null == rewardCurrency ? _self.rewardCurrency : rewardCurrency // ignore: cast_nullable_to_non_nullable
as int,isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,rewardClaimed: null == rewardClaimed ? _self.rewardClaimed : rewardClaimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Chapter].
extension ChapterPatterns on Chapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chapter value)  $default,){
final _that = this;
switch (_that) {
case _Chapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chapter value)?  $default,){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'reward_currency')  int rewardCurrency, @JsonKey(name: 'is_unlocked')  bool isUnlocked, @JsonKey(name: 'is_completed')  bool isCompleted, @JsonKey(name: 'reward_claimed')  bool rewardClaimed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.title,_that.orderIndex,_that.rewardCurrency,_that.isUnlocked,_that.isCompleted,_that.rewardClaimed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'reward_currency')  int rewardCurrency, @JsonKey(name: 'is_unlocked')  bool isUnlocked, @JsonKey(name: 'is_completed')  bool isCompleted, @JsonKey(name: 'reward_claimed')  bool rewardClaimed)  $default,) {final _that = this;
switch (_that) {
case _Chapter():
return $default(_that.id,_that.title,_that.orderIndex,_that.rewardCurrency,_that.isUnlocked,_that.isCompleted,_that.rewardClaimed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'order_index')  int orderIndex, @JsonKey(name: 'reward_currency')  int rewardCurrency, @JsonKey(name: 'is_unlocked')  bool isUnlocked, @JsonKey(name: 'is_completed')  bool isCompleted, @JsonKey(name: 'reward_claimed')  bool rewardClaimed)?  $default,) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.title,_that.orderIndex,_that.rewardCurrency,_that.isUnlocked,_that.isCompleted,_that.rewardClaimed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chapter implements Chapter {
  const _Chapter({required this.id, required this.title, @JsonKey(name: 'order_index') required this.orderIndex, @JsonKey(name: 'reward_currency') required this.rewardCurrency, @JsonKey(name: 'is_unlocked') required this.isUnlocked, @JsonKey(name: 'is_completed') required this.isCompleted, @JsonKey(name: 'reward_claimed') required this.rewardClaimed});
  factory _Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey(name: 'order_index') final  int orderIndex;
@override@JsonKey(name: 'reward_currency') final  int rewardCurrency;
@override@JsonKey(name: 'is_unlocked') final  bool isUnlocked;
@override@JsonKey(name: 'is_completed') final  bool isCompleted;
@override@JsonKey(name: 'reward_claimed') final  bool rewardClaimed;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterCopyWith<_Chapter> get copyWith => __$ChapterCopyWithImpl<_Chapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.rewardCurrency, rewardCurrency) || other.rewardCurrency == rewardCurrency)&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.rewardClaimed, rewardClaimed) || other.rewardClaimed == rewardClaimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,orderIndex,rewardCurrency,isUnlocked,isCompleted,rewardClaimed);
}

@override
String toString() {
    return 'Chapter(id: $id, title: $title, orderIndex: $orderIndex, rewardCurrency: $rewardCurrency, isUnlocked: $isUnlocked, isCompleted: $isCompleted, rewardClaimed: $rewardClaimed)';
}


}

/// @nodoc
abstract mixin class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) _then) = __$ChapterCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'order_index') int orderIndex,@JsonKey(name: 'reward_currency') int rewardCurrency,@JsonKey(name: 'is_unlocked') bool isUnlocked,@JsonKey(name: 'is_completed') bool isCompleted,@JsonKey(name: 'reward_claimed') bool rewardClaimed
});




}
/// @nodoc
class __$ChapterCopyWithImpl<$Res>
    implements _$ChapterCopyWith<$Res> {
  __$ChapterCopyWithImpl(this._self, this._then);

  final _Chapter _self;
  final $Res Function(_Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? orderIndex = null,Object? rewardCurrency = null,Object? isUnlocked = null,Object? isCompleted = null,Object? rewardClaimed = null,}) {
  return _then(_Chapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,rewardCurrency: null == rewardCurrency ? _self.rewardCurrency : rewardCurrency // ignore: cast_nullable_to_non_nullable
as int,isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,rewardClaimed: null == rewardClaimed ? _self.rewardClaimed : rewardClaimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$QuizQuestion {

 int get id;@JsonKey(name: 'question_text') String get questionText; List<String> get options;
/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizQuestionCopyWith<QuizQuestion> get copyWith => _$QuizQuestionCopyWithImpl<QuizQuestion>(this as QuizQuestion, _$identity);

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuizQuestion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizQuestion&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.questionText, _this.questionText) || other.questionText == _this.questionText)&&const DeepCollectionEquality().equals(other.options, _this.options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuizQuestion;
  return Object.hash(runtimeType,_this.id,_this.questionText,const DeepCollectionEquality().hash(_this.options));
}

@override
String toString() {
  final _this = this as QuizQuestion;
  return 'QuizQuestion(id: ${_this.id}, questionText: ${_this.questionText}, options: ${_this.options})';
}


}

/// @nodoc
abstract mixin class $QuizQuestionCopyWith<$Res>  {
  factory $QuizQuestionCopyWith(QuizQuestion value, $Res Function(QuizQuestion) _then) = _$QuizQuestionCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'question_text') String questionText, List<String> options
});




}
/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._self, this._then);

  final QuizQuestion _self;
  final $Res Function(QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? questionText = null,Object? options = null,}) {
  return _then(QuizQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizQuestion].
extension QuizQuestionPatterns on QuizQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizQuestion value)  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'question_text')  String questionText,  List<String> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.id,_that.questionText,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'question_text')  String questionText,  List<String> options)  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion():
return $default(_that.id,_that.questionText,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'question_text')  String questionText,  List<String> options)?  $default,) {final _that = this;
switch (_that) {
case _QuizQuestion() when $default != null:
return $default(_that.id,_that.questionText,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizQuestion implements QuizQuestion {
  const _QuizQuestion({required this.id, @JsonKey(name: 'question_text') required this.questionText, required  List<String> options}): _options = options;
  factory _QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);

@override final  int id;
@override@JsonKey(name: 'question_text') final  String questionText;
 final  List<String> _options;
@override List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizQuestionCopyWith<_QuizQuestion> get copyWith => __$QuizQuestionCopyWithImpl<_QuizQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&const DeepCollectionEquality().equals(other.options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,questionText,const DeepCollectionEquality().hash(_options));
}

@override
String toString() {
    return 'QuizQuestion(id: $id, questionText: $questionText, options: $options)';
}


}

/// @nodoc
abstract mixin class _$QuizQuestionCopyWith<$Res> implements $QuizQuestionCopyWith<$Res> {
  factory _$QuizQuestionCopyWith(_QuizQuestion value, $Res Function(_QuizQuestion) _then) = __$QuizQuestionCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'question_text') String questionText, List<String> options
});




}
/// @nodoc
class __$QuizQuestionCopyWithImpl<$Res>
    implements _$QuizQuestionCopyWith<$Res> {
  __$QuizQuestionCopyWithImpl(this._self, this._then);

  final _QuizQuestion _self;
  final $Res Function(_QuizQuestion) _then;

/// Create a copy of QuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? questionText = null,Object? options = null,}) {
  return _then(_QuizQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ChapterQuizResult {

@JsonKey(name: 'is_correct') bool get isCorrect;@JsonKey(name: 'chapter_done') bool get chapterDone;@JsonKey(name: 'reward_given') bool get rewardGiven;
/// Create a copy of ChapterQuizResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterQuizResultCopyWith<ChapterQuizResult> get copyWith => _$ChapterQuizResultCopyWithImpl<ChapterQuizResult>(this as ChapterQuizResult, _$identity);

  /// Serializes this ChapterQuizResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChapterQuizResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterQuizResult&&(identical(other.isCorrect, _this.isCorrect) || other.isCorrect == _this.isCorrect)&&(identical(other.chapterDone, _this.chapterDone) || other.chapterDone == _this.chapterDone)&&(identical(other.rewardGiven, _this.rewardGiven) || other.rewardGiven == _this.rewardGiven));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChapterQuizResult;
  return Object.hash(runtimeType,_this.isCorrect,_this.chapterDone,_this.rewardGiven);
}

@override
String toString() {
  final _this = this as ChapterQuizResult;
  return 'ChapterQuizResult(isCorrect: ${_this.isCorrect}, chapterDone: ${_this.chapterDone}, rewardGiven: ${_this.rewardGiven})';
}


}

/// @nodoc
abstract mixin class $ChapterQuizResultCopyWith<$Res>  {
  factory $ChapterQuizResultCopyWith(ChapterQuizResult value, $Res Function(ChapterQuizResult) _then) = _$ChapterQuizResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_correct') bool isCorrect,@JsonKey(name: 'chapter_done') bool chapterDone,@JsonKey(name: 'reward_given') bool rewardGiven
});




}
/// @nodoc
class _$ChapterQuizResultCopyWithImpl<$Res>
    implements $ChapterQuizResultCopyWith<$Res> {
  _$ChapterQuizResultCopyWithImpl(this._self, this._then);

  final ChapterQuizResult _self;
  final $Res Function(ChapterQuizResult) _then;

/// Create a copy of ChapterQuizResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCorrect = null,Object? chapterDone = null,Object? rewardGiven = null,}) {
  return _then(ChapterQuizResult(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,chapterDone: null == chapterDone ? _self.chapterDone : chapterDone // ignore: cast_nullable_to_non_nullable
as bool,rewardGiven: null == rewardGiven ? _self.rewardGiven : rewardGiven // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterQuizResult].
extension ChapterQuizResultPatterns on ChapterQuizResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterQuizResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterQuizResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterQuizResult value)  $default,){
final _that = this;
switch (_that) {
case _ChapterQuizResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterQuizResult value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterQuizResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_correct')  bool isCorrect, @JsonKey(name: 'chapter_done')  bool chapterDone, @JsonKey(name: 'reward_given')  bool rewardGiven)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterQuizResult() when $default != null:
return $default(_that.isCorrect,_that.chapterDone,_that.rewardGiven);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_correct')  bool isCorrect, @JsonKey(name: 'chapter_done')  bool chapterDone, @JsonKey(name: 'reward_given')  bool rewardGiven)  $default,) {final _that = this;
switch (_that) {
case _ChapterQuizResult():
return $default(_that.isCorrect,_that.chapterDone,_that.rewardGiven);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_correct')  bool isCorrect, @JsonKey(name: 'chapter_done')  bool chapterDone, @JsonKey(name: 'reward_given')  bool rewardGiven)?  $default,) {final _that = this;
switch (_that) {
case _ChapterQuizResult() when $default != null:
return $default(_that.isCorrect,_that.chapterDone,_that.rewardGiven);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterQuizResult implements ChapterQuizResult {
  const _ChapterQuizResult({@JsonKey(name: 'is_correct') required this.isCorrect, @JsonKey(name: 'chapter_done') required this.chapterDone, @JsonKey(name: 'reward_given') required this.rewardGiven});
  factory _ChapterQuizResult.fromJson(Map<String, dynamic> json) => _$ChapterQuizResultFromJson(json);

@override@JsonKey(name: 'is_correct') final  bool isCorrect;
@override@JsonKey(name: 'chapter_done') final  bool chapterDone;
@override@JsonKey(name: 'reward_given') final  bool rewardGiven;

/// Create a copy of ChapterQuizResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterQuizResultCopyWith<_ChapterQuizResult> get copyWith => __$ChapterQuizResultCopyWithImpl<_ChapterQuizResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterQuizResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterQuizResult&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.chapterDone, chapterDone) || other.chapterDone == chapterDone)&&(identical(other.rewardGiven, rewardGiven) || other.rewardGiven == rewardGiven));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,isCorrect,chapterDone,rewardGiven);
}

@override
String toString() {
    return 'ChapterQuizResult(isCorrect: $isCorrect, chapterDone: $chapterDone, rewardGiven: $rewardGiven)';
}


}

/// @nodoc
abstract mixin class _$ChapterQuizResultCopyWith<$Res> implements $ChapterQuizResultCopyWith<$Res> {
  factory _$ChapterQuizResultCopyWith(_ChapterQuizResult value, $Res Function(_ChapterQuizResult) _then) = __$ChapterQuizResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_correct') bool isCorrect,@JsonKey(name: 'chapter_done') bool chapterDone,@JsonKey(name: 'reward_given') bool rewardGiven
});




}
/// @nodoc
class __$ChapterQuizResultCopyWithImpl<$Res>
    implements _$ChapterQuizResultCopyWith<$Res> {
  __$ChapterQuizResultCopyWithImpl(this._self, this._then);

  final _ChapterQuizResult _self;
  final $Res Function(_ChapterQuizResult) _then;

/// Create a copy of ChapterQuizResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCorrect = null,Object? chapterDone = null,Object? rewardGiven = null,}) {
  return _then(_ChapterQuizResult(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,chapterDone: null == chapterDone ? _self.chapterDone : chapterDone // ignore: cast_nullable_to_non_nullable
as bool,rewardGiven: null == rewardGiven ? _self.rewardGiven : rewardGiven // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$HappinessQuizResult {

@JsonKey(name: 'is_correct') bool get isCorrect; int get happiness;
/// Create a copy of HappinessQuizResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HappinessQuizResultCopyWith<HappinessQuizResult> get copyWith => _$HappinessQuizResultCopyWithImpl<HappinessQuizResult>(this as HappinessQuizResult, _$identity);

  /// Serializes this HappinessQuizResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HappinessQuizResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HappinessQuizResult&&(identical(other.isCorrect, _this.isCorrect) || other.isCorrect == _this.isCorrect)&&(identical(other.happiness, _this.happiness) || other.happiness == _this.happiness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HappinessQuizResult;
  return Object.hash(runtimeType,_this.isCorrect,_this.happiness);
}

@override
String toString() {
  final _this = this as HappinessQuizResult;
  return 'HappinessQuizResult(isCorrect: ${_this.isCorrect}, happiness: ${_this.happiness})';
}


}

/// @nodoc
abstract mixin class $HappinessQuizResultCopyWith<$Res>  {
  factory $HappinessQuizResultCopyWith(HappinessQuizResult value, $Res Function(HappinessQuizResult) _then) = _$HappinessQuizResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_correct') bool isCorrect, int happiness
});




}
/// @nodoc
class _$HappinessQuizResultCopyWithImpl<$Res>
    implements $HappinessQuizResultCopyWith<$Res> {
  _$HappinessQuizResultCopyWithImpl(this._self, this._then);

  final HappinessQuizResult _self;
  final $Res Function(HappinessQuizResult) _then;

/// Create a copy of HappinessQuizResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isCorrect = null,Object? happiness = null,}) {
  return _then(HappinessQuizResult(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,happiness: null == happiness ? _self.happiness : happiness // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HappinessQuizResult].
extension HappinessQuizResultPatterns on HappinessQuizResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HappinessQuizResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HappinessQuizResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HappinessQuizResult value)  $default,){
final _that = this;
switch (_that) {
case _HappinessQuizResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HappinessQuizResult value)?  $default,){
final _that = this;
switch (_that) {
case _HappinessQuizResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_correct')  bool isCorrect,  int happiness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HappinessQuizResult() when $default != null:
return $default(_that.isCorrect,_that.happiness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_correct')  bool isCorrect,  int happiness)  $default,) {final _that = this;
switch (_that) {
case _HappinessQuizResult():
return $default(_that.isCorrect,_that.happiness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_correct')  bool isCorrect,  int happiness)?  $default,) {final _that = this;
switch (_that) {
case _HappinessQuizResult() when $default != null:
return $default(_that.isCorrect,_that.happiness);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HappinessQuizResult implements HappinessQuizResult {
  const _HappinessQuizResult({@JsonKey(name: 'is_correct') required this.isCorrect, required this.happiness});
  factory _HappinessQuizResult.fromJson(Map<String, dynamic> json) => _$HappinessQuizResultFromJson(json);

@override@JsonKey(name: 'is_correct') final  bool isCorrect;
@override final  int happiness;

/// Create a copy of HappinessQuizResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HappinessQuizResultCopyWith<_HappinessQuizResult> get copyWith => __$HappinessQuizResultCopyWithImpl<_HappinessQuizResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HappinessQuizResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HappinessQuizResult&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.happiness, happiness) || other.happiness == happiness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,isCorrect,happiness);
}

@override
String toString() {
    return 'HappinessQuizResult(isCorrect: $isCorrect, happiness: $happiness)';
}


}

/// @nodoc
abstract mixin class _$HappinessQuizResultCopyWith<$Res> implements $HappinessQuizResultCopyWith<$Res> {
  factory _$HappinessQuizResultCopyWith(_HappinessQuizResult value, $Res Function(_HappinessQuizResult) _then) = __$HappinessQuizResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_correct') bool isCorrect, int happiness
});




}
/// @nodoc
class __$HappinessQuizResultCopyWithImpl<$Res>
    implements _$HappinessQuizResultCopyWith<$Res> {
  __$HappinessQuizResultCopyWithImpl(this._self, this._then);

  final _HappinessQuizResult _self;
  final $Res Function(_HappinessQuizResult) _then;

/// Create a copy of HappinessQuizResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isCorrect = null,Object? happiness = null,}) {
  return _then(_HappinessQuizResult(
isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,happiness: null == happiness ? _self.happiness : happiness // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
