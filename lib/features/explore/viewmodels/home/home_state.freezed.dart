// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 String? get errorMessage; HomeStatus get status; Map<int, List<ShopModel>> get categoryShops; List<ShopModel> get featuredShops; List<CategoryModel> get categories;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.categoryShops, categoryShops)&&const DeepCollectionEquality().equals(other.featuredShops, featuredShops)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,status,const DeepCollectionEquality().hash(categoryShops),const DeepCollectionEquality().hash(featuredShops),const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'HomeState(errorMessage: $errorMessage, status: $status, categoryShops: $categoryShops, featuredShops: $featuredShops, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 String? errorMessage, HomeStatus status, Map<int, List<ShopModel>> categoryShops, List<ShopModel> featuredShops, List<CategoryModel> categories
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errorMessage = freezed,Object? status = null,Object? categoryShops = null,Object? featuredShops = null,Object? categories = null,}) {
  return _then(_self.copyWith(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus,categoryShops: null == categoryShops ? _self.categoryShops : categoryShops // ignore: cast_nullable_to_non_nullable
as Map<int, List<ShopModel>>,featuredShops: null == featuredShops ? _self.featuredShops : featuredShops // ignore: cast_nullable_to_non_nullable
as List<ShopModel>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? errorMessage,  HomeStatus status,  Map<int, List<ShopModel>> categoryShops,  List<ShopModel> featuredShops,  List<CategoryModel> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.errorMessage,_that.status,_that.categoryShops,_that.featuredShops,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? errorMessage,  HomeStatus status,  Map<int, List<ShopModel>> categoryShops,  List<ShopModel> featuredShops,  List<CategoryModel> categories)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.errorMessage,_that.status,_that.categoryShops,_that.featuredShops,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? errorMessage,  HomeStatus status,  Map<int, List<ShopModel>> categoryShops,  List<ShopModel> featuredShops,  List<CategoryModel> categories)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.errorMessage,_that.status,_that.categoryShops,_that.featuredShops,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.errorMessage, this.status = HomeStatus.initial, final  Map<int, List<ShopModel>> categoryShops = const {}, final  List<ShopModel> featuredShops = const [], final  List<CategoryModel> categories = const []}): _categoryShops = categoryShops,_featuredShops = featuredShops,_categories = categories;
  

@override final  String? errorMessage;
@override@JsonKey() final  HomeStatus status;
 final  Map<int, List<ShopModel>> _categoryShops;
@override@JsonKey() Map<int, List<ShopModel>> get categoryShops {
  if (_categoryShops is EqualUnmodifiableMapView) return _categoryShops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_categoryShops);
}

 final  List<ShopModel> _featuredShops;
@override@JsonKey() List<ShopModel> get featuredShops {
  if (_featuredShops is EqualUnmodifiableListView) return _featuredShops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featuredShops);
}

 final  List<CategoryModel> _categories;
@override@JsonKey() List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._categoryShops, _categoryShops)&&const DeepCollectionEquality().equals(other._featuredShops, _featuredShops)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage,status,const DeepCollectionEquality().hash(_categoryShops),const DeepCollectionEquality().hash(_featuredShops),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'HomeState(errorMessage: $errorMessage, status: $status, categoryShops: $categoryShops, featuredShops: $featuredShops, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 String? errorMessage, HomeStatus status, Map<int, List<ShopModel>> categoryShops, List<ShopModel> featuredShops, List<CategoryModel> categories
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMessage = freezed,Object? status = null,Object? categoryShops = null,Object? featuredShops = null,Object? categories = null,}) {
  return _then(_HomeState(
errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus,categoryShops: null == categoryShops ? _self._categoryShops : categoryShops // ignore: cast_nullable_to_non_nullable
as Map<int, List<ShopModel>>,featuredShops: null == featuredShops ? _self._featuredShops : featuredShops // ignore: cast_nullable_to_non_nullable
as List<ShopModel>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}


}

// dart format on
