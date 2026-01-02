// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsored.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sponsored {

 int get id; String get image; String get title; String get description;@JsonKey(name: 'details_url') String get detailsUrl;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of Sponsored
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsoredCopyWith<Sponsored> get copyWith => _$SponsoredCopyWithImpl<Sponsored>(this as Sponsored, _$identity);

  /// Serializes this Sponsored to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sponsored&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.detailsUrl, detailsUrl) || other.detailsUrl == detailsUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,title,description,detailsUrl,isActive,createdAt);

@override
String toString() {
  return 'Sponsored(id: $id, image: $image, title: $title, description: $description, detailsUrl: $detailsUrl, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SponsoredCopyWith<$Res>  {
  factory $SponsoredCopyWith(Sponsored value, $Res Function(Sponsored) _then) = _$SponsoredCopyWithImpl;
@useResult
$Res call({
 int id, String image, String title, String description,@JsonKey(name: 'details_url') String detailsUrl,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$SponsoredCopyWithImpl<$Res>
    implements $SponsoredCopyWith<$Res> {
  _$SponsoredCopyWithImpl(this._self, this._then);

  final Sponsored _self;
  final $Res Function(Sponsored) _then;

/// Create a copy of Sponsored
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? image = null,Object? title = null,Object? description = null,Object? detailsUrl = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,detailsUrl: null == detailsUrl ? _self.detailsUrl : detailsUrl // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Sponsored].
extension SponsoredPatterns on Sponsored {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sponsored value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sponsored() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sponsored value)  $default,){
final _that = this;
switch (_that) {
case _Sponsored():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sponsored value)?  $default,){
final _that = this;
switch (_that) {
case _Sponsored() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String image,  String title,  String description, @JsonKey(name: 'details_url')  String detailsUrl, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sponsored() when $default != null:
return $default(_that.id,_that.image,_that.title,_that.description,_that.detailsUrl,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String image,  String title,  String description, @JsonKey(name: 'details_url')  String detailsUrl, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Sponsored():
return $default(_that.id,_that.image,_that.title,_that.description,_that.detailsUrl,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String image,  String title,  String description, @JsonKey(name: 'details_url')  String detailsUrl, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Sponsored() when $default != null:
return $default(_that.id,_that.image,_that.title,_that.description,_that.detailsUrl,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sponsored implements Sponsored {
  const _Sponsored({required this.id, required this.image, required this.title, required this.description, @JsonKey(name: 'details_url') required this.detailsUrl, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Sponsored.fromJson(Map<String, dynamic> json) => _$SponsoredFromJson(json);

@override final  int id;
@override final  String image;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'details_url') final  String detailsUrl;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of Sponsored
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsoredCopyWith<_Sponsored> get copyWith => __$SponsoredCopyWithImpl<_Sponsored>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsoredToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sponsored&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.detailsUrl, detailsUrl) || other.detailsUrl == detailsUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,image,title,description,detailsUrl,isActive,createdAt);

@override
String toString() {
  return 'Sponsored(id: $id, image: $image, title: $title, description: $description, detailsUrl: $detailsUrl, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SponsoredCopyWith<$Res> implements $SponsoredCopyWith<$Res> {
  factory _$SponsoredCopyWith(_Sponsored value, $Res Function(_Sponsored) _then) = __$SponsoredCopyWithImpl;
@override @useResult
$Res call({
 int id, String image, String title, String description,@JsonKey(name: 'details_url') String detailsUrl,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$SponsoredCopyWithImpl<$Res>
    implements _$SponsoredCopyWith<$Res> {
  __$SponsoredCopyWithImpl(this._self, this._then);

  final _Sponsored _self;
  final $Res Function(_Sponsored) _then;

/// Create a copy of Sponsored
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? image = null,Object? title = null,Object? description = null,Object? detailsUrl = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_Sponsored(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,detailsUrl: null == detailsUrl ? _self.detailsUrl : detailsUrl // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
