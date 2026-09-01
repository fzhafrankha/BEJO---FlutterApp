// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterContent {

 int get id; String get title; List<ChapterSection> get sections; List<String> get imageAssets;
/// Create a copy of ChapterContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterContentCopyWith<ChapterContent> get copyWith => _$ChapterContentCopyWithImpl<ChapterContent>(this as ChapterContent, _$identity);

  /// Serializes this ChapterContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChapterContent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterContent&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.sections, _this.sections)&&const DeepCollectionEquality().equals(other.imageAssets, _this.imageAssets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChapterContent;
  return Object.hash(runtimeType,_this.id,_this.title,const DeepCollectionEquality().hash(_this.sections),const DeepCollectionEquality().hash(_this.imageAssets));
}

@override
String toString() {
  final _this = this as ChapterContent;
  return 'ChapterContent(id: ${_this.id}, title: ${_this.title}, sections: ${_this.sections}, imageAssets: ${_this.imageAssets})';
}


}

/// @nodoc
abstract mixin class $ChapterContentCopyWith<$Res>  {
  factory $ChapterContentCopyWith(ChapterContent value, $Res Function(ChapterContent) _then) = _$ChapterContentCopyWithImpl;
@useResult
$Res call({
 int id, String title, List<ChapterSection> sections, List<String> imageAssets
});




}
/// @nodoc
class _$ChapterContentCopyWithImpl<$Res>
    implements $ChapterContentCopyWith<$Res> {
  _$ChapterContentCopyWithImpl(this._self, this._then);

  final ChapterContent _self;
  final $Res Function(ChapterContent) _then;

/// Create a copy of ChapterContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? sections = null,Object? imageAssets = null,}) {
  return _then(ChapterContent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<ChapterSection>,imageAssets: null == imageAssets ? _self.imageAssets : imageAssets // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterContent].
extension ChapterContentPatterns on ChapterContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterContent value)  $default,){
final _that = this;
switch (_that) {
case _ChapterContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterContent value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  List<ChapterSection> sections,  List<String> imageAssets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterContent() when $default != null:
return $default(_that.id,_that.title,_that.sections,_that.imageAssets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  List<ChapterSection> sections,  List<String> imageAssets)  $default,) {final _that = this;
switch (_that) {
case _ChapterContent():
return $default(_that.id,_that.title,_that.sections,_that.imageAssets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  List<ChapterSection> sections,  List<String> imageAssets)?  $default,) {final _that = this;
switch (_that) {
case _ChapterContent() when $default != null:
return $default(_that.id,_that.title,_that.sections,_that.imageAssets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterContent implements ChapterContent {
  const _ChapterContent({required this.id, required this.title, required  List<ChapterSection> sections,  List<String> imageAssets = const []}): _sections = sections,_imageAssets = imageAssets;
  factory _ChapterContent.fromJson(Map<String, dynamic> json) => _$ChapterContentFromJson(json);

@override final  int id;
@override final  String title;
 final  List<ChapterSection> _sections;
@override List<ChapterSection> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

 final  List<String> _imageAssets;
@override@JsonKey() List<String> get imageAssets {
  if (_imageAssets is EqualUnmodifiableListView) return _imageAssets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageAssets);
}


/// Create a copy of ChapterContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterContentCopyWith<_ChapterContent> get copyWith => __$ChapterContentCopyWithImpl<_ChapterContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterContentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.sections, _sections)&&const DeepCollectionEquality().equals(other.imageAssets, _imageAssets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_sections),const DeepCollectionEquality().hash(_imageAssets));
}

@override
String toString() {
    return 'ChapterContent(id: $id, title: $title, sections: $sections, imageAssets: $imageAssets)';
}


}

/// @nodoc
abstract mixin class _$ChapterContentCopyWith<$Res> implements $ChapterContentCopyWith<$Res> {
  factory _$ChapterContentCopyWith(_ChapterContent value, $Res Function(_ChapterContent) _then) = __$ChapterContentCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, List<ChapterSection> sections, List<String> imageAssets
});




}
/// @nodoc
class __$ChapterContentCopyWithImpl<$Res>
    implements _$ChapterContentCopyWith<$Res> {
  __$ChapterContentCopyWithImpl(this._self, this._then);

  final _ChapterContent _self;
  final $Res Function(_ChapterContent) _then;

/// Create a copy of ChapterContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? sections = null,Object? imageAssets = null,}) {
  return _then(_ChapterContent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<ChapterSection>,imageAssets: null == imageAssets ? _self._imageAssets : imageAssets // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ChapterSection {

 String get heading; String get body;
/// Create a copy of ChapterSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterSectionCopyWith<ChapterSection> get copyWith => _$ChapterSectionCopyWithImpl<ChapterSection>(this as ChapterSection, _$identity);

  /// Serializes this ChapterSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChapterSection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterSection&&(identical(other.heading, _this.heading) || other.heading == _this.heading)&&(identical(other.body, _this.body) || other.body == _this.body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChapterSection;
  return Object.hash(runtimeType,_this.heading,_this.body);
}

@override
String toString() {
  final _this = this as ChapterSection;
  return 'ChapterSection(heading: ${_this.heading}, body: ${_this.body})';
}


}

/// @nodoc
abstract mixin class $ChapterSectionCopyWith<$Res>  {
  factory $ChapterSectionCopyWith(ChapterSection value, $Res Function(ChapterSection) _then) = _$ChapterSectionCopyWithImpl;
@useResult
$Res call({
 String heading, String body
});




}
/// @nodoc
class _$ChapterSectionCopyWithImpl<$Res>
    implements $ChapterSectionCopyWith<$Res> {
  _$ChapterSectionCopyWithImpl(this._self, this._then);

  final ChapterSection _self;
  final $Res Function(ChapterSection) _then;

/// Create a copy of ChapterSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? heading = null,Object? body = null,}) {
  return _then(ChapterSection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterSection].
extension ChapterSectionPatterns on ChapterSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterSection value)  $default,){
final _that = this;
switch (_that) {
case _ChapterSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterSection value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String heading,  String body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterSection() when $default != null:
return $default(_that.heading,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String heading,  String body)  $default,) {final _that = this;
switch (_that) {
case _ChapterSection():
return $default(_that.heading,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String heading,  String body)?  $default,) {final _that = this;
switch (_that) {
case _ChapterSection() when $default != null:
return $default(_that.heading,_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterSection implements ChapterSection {
  const _ChapterSection({required this.heading, required this.body});
  factory _ChapterSection.fromJson(Map<String, dynamic> json) => _$ChapterSectionFromJson(json);

@override final  String heading;
@override final  String body;

/// Create a copy of ChapterSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterSectionCopyWith<_ChapterSection> get copyWith => __$ChapterSectionCopyWithImpl<_ChapterSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterSectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterSection&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,heading,body);
}

@override
String toString() {
    return 'ChapterSection(heading: $heading, body: $body)';
}


}

/// @nodoc
abstract mixin class _$ChapterSectionCopyWith<$Res> implements $ChapterSectionCopyWith<$Res> {
  factory _$ChapterSectionCopyWith(_ChapterSection value, $Res Function(_ChapterSection) _then) = __$ChapterSectionCopyWithImpl;
@override @useResult
$Res call({
 String heading, String body
});




}
/// @nodoc
class __$ChapterSectionCopyWithImpl<$Res>
    implements _$ChapterSectionCopyWith<$Res> {
  __$ChapterSectionCopyWithImpl(this._self, this._then);

  final _ChapterSection _self;
  final $Res Function(_ChapterSection) _then;

/// Create a copy of ChapterSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heading = null,Object? body = null,}) {
  return _then(_ChapterSection(
heading: null == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
