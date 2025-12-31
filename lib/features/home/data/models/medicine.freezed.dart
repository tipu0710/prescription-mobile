// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Medicine {

 int get id;@JsonKey(name: 'brand_name') String get brandName;@JsonKey(name: 'generic_name') String get genericName; String get strength; String get manufacturer;@JsonKey(name: 'dosage_form') String get dosageForm;
/// Create a copy of Medicine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicineCopyWith<Medicine> get copyWith => _$MedicineCopyWithImpl<Medicine>(this as Medicine, _$identity);

  /// Serializes this Medicine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Medicine&&(identical(other.id, id) || other.id == id)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.dosageForm, dosageForm) || other.dosageForm == dosageForm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brandName,genericName,strength,manufacturer,dosageForm);

@override
String toString() {
  return 'Medicine(id: $id, brandName: $brandName, genericName: $genericName, strength: $strength, manufacturer: $manufacturer, dosageForm: $dosageForm)';
}


}

/// @nodoc
abstract mixin class $MedicineCopyWith<$Res>  {
  factory $MedicineCopyWith(Medicine value, $Res Function(Medicine) _then) = _$MedicineCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'brand_name') String brandName,@JsonKey(name: 'generic_name') String genericName, String strength, String manufacturer,@JsonKey(name: 'dosage_form') String dosageForm
});




}
/// @nodoc
class _$MedicineCopyWithImpl<$Res>
    implements $MedicineCopyWith<$Res> {
  _$MedicineCopyWithImpl(this._self, this._then);

  final Medicine _self;
  final $Res Function(Medicine) _then;

/// Create a copy of Medicine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brandName = null,Object? genericName = null,Object? strength = null,Object? manufacturer = null,Object? dosageForm = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,genericName: null == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String,dosageForm: null == dosageForm ? _self.dosageForm : dosageForm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Medicine].
extension MedicinePatterns on Medicine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Medicine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Medicine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Medicine value)  $default,){
final _that = this;
switch (_that) {
case _Medicine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Medicine value)?  $default,){
final _that = this;
switch (_that) {
case _Medicine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'brand_name')  String brandName, @JsonKey(name: 'generic_name')  String genericName,  String strength,  String manufacturer, @JsonKey(name: 'dosage_form')  String dosageForm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Medicine() when $default != null:
return $default(_that.id,_that.brandName,_that.genericName,_that.strength,_that.manufacturer,_that.dosageForm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'brand_name')  String brandName, @JsonKey(name: 'generic_name')  String genericName,  String strength,  String manufacturer, @JsonKey(name: 'dosage_form')  String dosageForm)  $default,) {final _that = this;
switch (_that) {
case _Medicine():
return $default(_that.id,_that.brandName,_that.genericName,_that.strength,_that.manufacturer,_that.dosageForm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'brand_name')  String brandName, @JsonKey(name: 'generic_name')  String genericName,  String strength,  String manufacturer, @JsonKey(name: 'dosage_form')  String dosageForm)?  $default,) {final _that = this;
switch (_that) {
case _Medicine() when $default != null:
return $default(_that.id,_that.brandName,_that.genericName,_that.strength,_that.manufacturer,_that.dosageForm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Medicine implements Medicine {
  const _Medicine({required this.id, @JsonKey(name: 'brand_name') required this.brandName, @JsonKey(name: 'generic_name') required this.genericName, required this.strength, required this.manufacturer, @JsonKey(name: 'dosage_form') required this.dosageForm});
  factory _Medicine.fromJson(Map<String, dynamic> json) => _$MedicineFromJson(json);

@override final  int id;
@override@JsonKey(name: 'brand_name') final  String brandName;
@override@JsonKey(name: 'generic_name') final  String genericName;
@override final  String strength;
@override final  String manufacturer;
@override@JsonKey(name: 'dosage_form') final  String dosageForm;

/// Create a copy of Medicine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicineCopyWith<_Medicine> get copyWith => __$MedicineCopyWithImpl<_Medicine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Medicine&&(identical(other.id, id) || other.id == id)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.dosageForm, dosageForm) || other.dosageForm == dosageForm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brandName,genericName,strength,manufacturer,dosageForm);

@override
String toString() {
  return 'Medicine(id: $id, brandName: $brandName, genericName: $genericName, strength: $strength, manufacturer: $manufacturer, dosageForm: $dosageForm)';
}


}

/// @nodoc
abstract mixin class _$MedicineCopyWith<$Res> implements $MedicineCopyWith<$Res> {
  factory _$MedicineCopyWith(_Medicine value, $Res Function(_Medicine) _then) = __$MedicineCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'brand_name') String brandName,@JsonKey(name: 'generic_name') String genericName, String strength, String manufacturer,@JsonKey(name: 'dosage_form') String dosageForm
});




}
/// @nodoc
class __$MedicineCopyWithImpl<$Res>
    implements _$MedicineCopyWith<$Res> {
  __$MedicineCopyWithImpl(this._self, this._then);

  final _Medicine _self;
  final $Res Function(_Medicine) _then;

/// Create a copy of Medicine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brandName = null,Object? genericName = null,Object? strength = null,Object? manufacturer = null,Object? dosageForm = null,}) {
  return _then(_Medicine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,genericName: null == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String,dosageForm: null == dosageForm ? _self.dosageForm : dosageForm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
