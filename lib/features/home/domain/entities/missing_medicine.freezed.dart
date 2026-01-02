// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'missing_medicine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MissingMedicine {

@JsonKey(name: 'brand_name') String get brandName;@JsonKey(name: 'dosage_form') String get dosageForm; String get strength;
/// Create a copy of MissingMedicine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MissingMedicineCopyWith<MissingMedicine> get copyWith => _$MissingMedicineCopyWithImpl<MissingMedicine>(this as MissingMedicine, _$identity);

  /// Serializes this MissingMedicine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MissingMedicine&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.dosageForm, dosageForm) || other.dosageForm == dosageForm)&&(identical(other.strength, strength) || other.strength == strength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brandName,dosageForm,strength);

@override
String toString() {
  return 'MissingMedicine(brandName: $brandName, dosageForm: $dosageForm, strength: $strength)';
}


}

/// @nodoc
abstract mixin class $MissingMedicineCopyWith<$Res>  {
  factory $MissingMedicineCopyWith(MissingMedicine value, $Res Function(MissingMedicine) _then) = _$MissingMedicineCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'brand_name') String brandName,@JsonKey(name: 'dosage_form') String dosageForm, String strength
});




}
/// @nodoc
class _$MissingMedicineCopyWithImpl<$Res>
    implements $MissingMedicineCopyWith<$Res> {
  _$MissingMedicineCopyWithImpl(this._self, this._then);

  final MissingMedicine _self;
  final $Res Function(MissingMedicine) _then;

/// Create a copy of MissingMedicine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? brandName = null,Object? dosageForm = null,Object? strength = null,}) {
  return _then(_self.copyWith(
brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,dosageForm: null == dosageForm ? _self.dosageForm : dosageForm // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MissingMedicine].
extension MissingMedicinePatterns on MissingMedicine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MissingMedicine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MissingMedicine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MissingMedicine value)  $default,){
final _that = this;
switch (_that) {
case _MissingMedicine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MissingMedicine value)?  $default,){
final _that = this;
switch (_that) {
case _MissingMedicine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'brand_name')  String brandName, @JsonKey(name: 'dosage_form')  String dosageForm,  String strength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MissingMedicine() when $default != null:
return $default(_that.brandName,_that.dosageForm,_that.strength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'brand_name')  String brandName, @JsonKey(name: 'dosage_form')  String dosageForm,  String strength)  $default,) {final _that = this;
switch (_that) {
case _MissingMedicine():
return $default(_that.brandName,_that.dosageForm,_that.strength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'brand_name')  String brandName, @JsonKey(name: 'dosage_form')  String dosageForm,  String strength)?  $default,) {final _that = this;
switch (_that) {
case _MissingMedicine() when $default != null:
return $default(_that.brandName,_that.dosageForm,_that.strength);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MissingMedicine implements MissingMedicine {
  const _MissingMedicine({@JsonKey(name: 'brand_name') required this.brandName, @JsonKey(name: 'dosage_form') required this.dosageForm, required this.strength});
  factory _MissingMedicine.fromJson(Map<String, dynamic> json) => _$MissingMedicineFromJson(json);

@override@JsonKey(name: 'brand_name') final  String brandName;
@override@JsonKey(name: 'dosage_form') final  String dosageForm;
@override final  String strength;

/// Create a copy of MissingMedicine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MissingMedicineCopyWith<_MissingMedicine> get copyWith => __$MissingMedicineCopyWithImpl<_MissingMedicine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MissingMedicineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MissingMedicine&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.dosageForm, dosageForm) || other.dosageForm == dosageForm)&&(identical(other.strength, strength) || other.strength == strength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,brandName,dosageForm,strength);

@override
String toString() {
  return 'MissingMedicine(brandName: $brandName, dosageForm: $dosageForm, strength: $strength)';
}


}

/// @nodoc
abstract mixin class _$MissingMedicineCopyWith<$Res> implements $MissingMedicineCopyWith<$Res> {
  factory _$MissingMedicineCopyWith(_MissingMedicine value, $Res Function(_MissingMedicine) _then) = __$MissingMedicineCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'brand_name') String brandName,@JsonKey(name: 'dosage_form') String dosageForm, String strength
});




}
/// @nodoc
class __$MissingMedicineCopyWithImpl<$Res>
    implements _$MissingMedicineCopyWith<$Res> {
  __$MissingMedicineCopyWithImpl(this._self, this._then);

  final _MissingMedicine _self;
  final $Res Function(_MissingMedicine) _then;

/// Create a copy of MissingMedicine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? brandName = null,Object? dosageForm = null,Object? strength = null,}) {
  return _then(_MissingMedicine(
brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,dosageForm: null == dosageForm ? _self.dosageForm : dosageForm // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
