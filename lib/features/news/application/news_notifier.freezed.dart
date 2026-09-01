// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsListState {

 List<NewsItem> get items; int get page; bool get hasMore; bool get isLoadingMore; bool get isInitialLoading; String? get errorMessage;
/// Create a copy of NewsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsListStateCopyWith<NewsListState> get copyWith => _$NewsListStateCopyWithImpl<NewsListState>(this as NewsListState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NewsListState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsListState&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.isLoadingMore, _this.isLoadingMore) || other.isLoadingMore == _this.isLoadingMore)&&(identical(other.isInitialLoading, _this.isInitialLoading) || other.isInitialLoading == _this.isInitialLoading)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as NewsListState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.page,_this.hasMore,_this.isLoadingMore,_this.isInitialLoading,_this.errorMessage);
}

@override
String toString() {
  final _this = this as NewsListState;
  return 'NewsListState(items: ${_this.items}, page: ${_this.page}, hasMore: ${_this.hasMore}, isLoadingMore: ${_this.isLoadingMore}, isInitialLoading: ${_this.isInitialLoading}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $NewsListStateCopyWith<$Res>  {
  factory $NewsListStateCopyWith(NewsListState value, $Res Function(NewsListState) _then) = _$NewsListStateCopyWithImpl;
@useResult
$Res call({
 List<NewsItem> items, int page, bool hasMore, bool isLoadingMore, bool isInitialLoading, String? errorMessage
});




}
/// @nodoc
class _$NewsListStateCopyWithImpl<$Res>
    implements $NewsListStateCopyWith<$Res> {
  _$NewsListStateCopyWithImpl(this._self, this._then);

  final NewsListState _self;
  final $Res Function(NewsListState) _then;

/// Create a copy of NewsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? hasMore = null,Object? isLoadingMore = null,Object? isInitialLoading = null,Object? errorMessage = freezed,}) {
  return _then(NewsListState(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<NewsItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsListState].
extension NewsListStatePatterns on NewsListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsListState value)  $default,){
final _that = this;
switch (_that) {
case _NewsListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsListState value)?  $default,){
final _that = this;
switch (_that) {
case _NewsListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NewsItem> items,  int page,  bool hasMore,  bool isLoadingMore,  bool isInitialLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsListState() when $default != null:
return $default(_that.items,_that.page,_that.hasMore,_that.isLoadingMore,_that.isInitialLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NewsItem> items,  int page,  bool hasMore,  bool isLoadingMore,  bool isInitialLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _NewsListState():
return $default(_that.items,_that.page,_that.hasMore,_that.isLoadingMore,_that.isInitialLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NewsItem> items,  int page,  bool hasMore,  bool isLoadingMore,  bool isInitialLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _NewsListState() when $default != null:
return $default(_that.items,_that.page,_that.hasMore,_that.isLoadingMore,_that.isInitialLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NewsListState implements NewsListState {
  const _NewsListState({ List<NewsItem> items = const [], this.page = 1, this.hasMore = true, this.isLoadingMore = false, this.isInitialLoading = true, this.errorMessage}): _items = items;
  

 final  List<NewsItem> _items;
@override@JsonKey() List<NewsItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isInitialLoading;
@override final  String? errorMessage;

/// Create a copy of NewsListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsListStateCopyWith<_NewsListState> get copyWith => __$NewsListStateCopyWithImpl<_NewsListState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsListState&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isInitialLoading, isInitialLoading) || other.isInitialLoading == isInitialLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,hasMore,isLoadingMore,isInitialLoading,errorMessage);
}

@override
String toString() {
    return 'NewsListState(items: $items, page: $page, hasMore: $hasMore, isLoadingMore: $isLoadingMore, isInitialLoading: $isInitialLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$NewsListStateCopyWith<$Res> implements $NewsListStateCopyWith<$Res> {
  factory _$NewsListStateCopyWith(_NewsListState value, $Res Function(_NewsListState) _then) = __$NewsListStateCopyWithImpl;
@override @useResult
$Res call({
 List<NewsItem> items, int page, bool hasMore, bool isLoadingMore, bool isInitialLoading, String? errorMessage
});




}
/// @nodoc
class __$NewsListStateCopyWithImpl<$Res>
    implements _$NewsListStateCopyWith<$Res> {
  __$NewsListStateCopyWithImpl(this._self, this._then);

  final _NewsListState _self;
  final $Res Function(_NewsListState) _then;

/// Create a copy of NewsListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? hasMore = null,Object? isLoadingMore = null,Object? isInitialLoading = null,Object? errorMessage = freezed,}) {
  return _then(_NewsListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<NewsItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isInitialLoading: null == isInitialLoading ? _self.isInitialLoading : isInitialLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
