// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsItem {

 int get id; String get title; String get url;@JsonKey(name: 'image_url') String get imageUrl; String get source;@JsonKey(name: 'published_at') DateTime get publishedAt;
/// Create a copy of NewsItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsItemCopyWith<NewsItem> get copyWith => _$NewsItemCopyWithImpl<NewsItem>(this as NewsItem, _$identity);

  /// Serializes this NewsItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NewsItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.publishedAt, _this.publishedAt) || other.publishedAt == _this.publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NewsItem;
  return Object.hash(runtimeType,_this.id,_this.title,_this.url,_this.imageUrl,_this.source,_this.publishedAt);
}

@override
String toString() {
  final _this = this as NewsItem;
  return 'NewsItem(id: ${_this.id}, title: ${_this.title}, url: ${_this.url}, imageUrl: ${_this.imageUrl}, source: ${_this.source}, publishedAt: ${_this.publishedAt})';
}


}

/// @nodoc
abstract mixin class $NewsItemCopyWith<$Res>  {
  factory $NewsItemCopyWith(NewsItem value, $Res Function(NewsItem) _then) = _$NewsItemCopyWithImpl;
@useResult
$Res call({
 int id, String title, String url,@JsonKey(name: 'image_url') String imageUrl, String source,@JsonKey(name: 'published_at') DateTime publishedAt
});




}
/// @nodoc
class _$NewsItemCopyWithImpl<$Res>
    implements $NewsItemCopyWith<$Res> {
  _$NewsItemCopyWithImpl(this._self, this._then);

  final NewsItem _self;
  final $Res Function(NewsItem) _then;

/// Create a copy of NewsItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? url = null,Object? imageUrl = null,Object? source = null,Object? publishedAt = null,}) {
  return _then(NewsItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsItem].
extension NewsItemPatterns on NewsItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsItem value)  $default,){
final _that = this;
switch (_that) {
case _NewsItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsItem value)?  $default,){
final _that = this;
switch (_that) {
case _NewsItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String url, @JsonKey(name: 'image_url')  String imageUrl,  String source, @JsonKey(name: 'published_at')  DateTime publishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsItem() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.imageUrl,_that.source,_that.publishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String url, @JsonKey(name: 'image_url')  String imageUrl,  String source, @JsonKey(name: 'published_at')  DateTime publishedAt)  $default,) {final _that = this;
switch (_that) {
case _NewsItem():
return $default(_that.id,_that.title,_that.url,_that.imageUrl,_that.source,_that.publishedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String url, @JsonKey(name: 'image_url')  String imageUrl,  String source, @JsonKey(name: 'published_at')  DateTime publishedAt)?  $default,) {final _that = this;
switch (_that) {
case _NewsItem() when $default != null:
return $default(_that.id,_that.title,_that.url,_that.imageUrl,_that.source,_that.publishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsItem implements NewsItem {
  const _NewsItem({required this.id, required this.title, required this.url, @JsonKey(name: 'image_url') required this.imageUrl, required this.source, @JsonKey(name: 'published_at') required this.publishedAt});
  factory _NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);

@override final  int id;
@override final  String title;
@override final  String url;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override final  String source;
@override@JsonKey(name: 'published_at') final  DateTime publishedAt;

/// Create a copy of NewsItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsItemCopyWith<_NewsItem> get copyWith => __$NewsItemCopyWithImpl<_NewsItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.source, source) || other.source == source)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,url,imageUrl,source,publishedAt);
}

@override
String toString() {
    return 'NewsItem(id: $id, title: $title, url: $url, imageUrl: $imageUrl, source: $source, publishedAt: $publishedAt)';
}


}

/// @nodoc
abstract mixin class _$NewsItemCopyWith<$Res> implements $NewsItemCopyWith<$Res> {
  factory _$NewsItemCopyWith(_NewsItem value, $Res Function(_NewsItem) _then) = __$NewsItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String url,@JsonKey(name: 'image_url') String imageUrl, String source,@JsonKey(name: 'published_at') DateTime publishedAt
});




}
/// @nodoc
class __$NewsItemCopyWithImpl<$Res>
    implements _$NewsItemCopyWith<$Res> {
  __$NewsItemCopyWithImpl(this._self, this._then);

  final _NewsItem _self;
  final $Res Function(_NewsItem) _then;

/// Create a copy of NewsItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? url = null,Object? imageUrl = null,Object? source = null,Object? publishedAt = null,}) {
  return _then(_NewsItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
