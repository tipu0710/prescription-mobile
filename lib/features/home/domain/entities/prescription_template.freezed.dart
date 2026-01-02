// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalizedMedicine {

 int get id; String get slug;@JsonKey(name: 'brand_name') String get brandName;@JsonKey(name: 'generic_name') String get genericName; String get strength; String get manufacturer;@JsonKey(name: 'dosage_form') String get dosageForm;
/// Create a copy of LocalizedMedicine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizedMedicineCopyWith<LocalizedMedicine> get copyWith => _$LocalizedMedicineCopyWithImpl<LocalizedMedicine>(this as LocalizedMedicine, _$identity);

  /// Serializes this LocalizedMedicine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizedMedicine&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.dosageForm, dosageForm) || other.dosageForm == dosageForm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,brandName,genericName,strength,manufacturer,dosageForm);

@override
String toString() {
  return 'LocalizedMedicine(id: $id, slug: $slug, brandName: $brandName, genericName: $genericName, strength: $strength, manufacturer: $manufacturer, dosageForm: $dosageForm)';
}


}

/// @nodoc
abstract mixin class $LocalizedMedicineCopyWith<$Res>  {
  factory $LocalizedMedicineCopyWith(LocalizedMedicine value, $Res Function(LocalizedMedicine) _then) = _$LocalizedMedicineCopyWithImpl;
@useResult
$Res call({
 int id, String slug,@JsonKey(name: 'brand_name') String brandName,@JsonKey(name: 'generic_name') String genericName, String strength, String manufacturer,@JsonKey(name: 'dosage_form') String dosageForm
});




}
/// @nodoc
class _$LocalizedMedicineCopyWithImpl<$Res>
    implements $LocalizedMedicineCopyWith<$Res> {
  _$LocalizedMedicineCopyWithImpl(this._self, this._then);

  final LocalizedMedicine _self;
  final $Res Function(LocalizedMedicine) _then;

/// Create a copy of LocalizedMedicine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? brandName = null,Object? genericName = null,Object? strength = null,Object? manufacturer = null,Object? dosageForm = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,genericName: null == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String,dosageForm: null == dosageForm ? _self.dosageForm : dosageForm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizedMedicine].
extension LocalizedMedicinePatterns on LocalizedMedicine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizedMedicine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizedMedicine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizedMedicine value)  $default,){
final _that = this;
switch (_that) {
case _LocalizedMedicine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizedMedicine value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizedMedicine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String slug, @JsonKey(name: 'brand_name')  String brandName, @JsonKey(name: 'generic_name')  String genericName,  String strength,  String manufacturer, @JsonKey(name: 'dosage_form')  String dosageForm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizedMedicine() when $default != null:
return $default(_that.id,_that.slug,_that.brandName,_that.genericName,_that.strength,_that.manufacturer,_that.dosageForm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String slug, @JsonKey(name: 'brand_name')  String brandName, @JsonKey(name: 'generic_name')  String genericName,  String strength,  String manufacturer, @JsonKey(name: 'dosage_form')  String dosageForm)  $default,) {final _that = this;
switch (_that) {
case _LocalizedMedicine():
return $default(_that.id,_that.slug,_that.brandName,_that.genericName,_that.strength,_that.manufacturer,_that.dosageForm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String slug, @JsonKey(name: 'brand_name')  String brandName, @JsonKey(name: 'generic_name')  String genericName,  String strength,  String manufacturer, @JsonKey(name: 'dosage_form')  String dosageForm)?  $default,) {final _that = this;
switch (_that) {
case _LocalizedMedicine() when $default != null:
return $default(_that.id,_that.slug,_that.brandName,_that.genericName,_that.strength,_that.manufacturer,_that.dosageForm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalizedMedicine implements LocalizedMedicine {
  const _LocalizedMedicine({required this.id, required this.slug, @JsonKey(name: 'brand_name') required this.brandName, @JsonKey(name: 'generic_name') required this.genericName, required this.strength, required this.manufacturer, @JsonKey(name: 'dosage_form') required this.dosageForm});
  factory _LocalizedMedicine.fromJson(Map<String, dynamic> json) => _$LocalizedMedicineFromJson(json);

@override final  int id;
@override final  String slug;
@override@JsonKey(name: 'brand_name') final  String brandName;
@override@JsonKey(name: 'generic_name') final  String genericName;
@override final  String strength;
@override final  String manufacturer;
@override@JsonKey(name: 'dosage_form') final  String dosageForm;

/// Create a copy of LocalizedMedicine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizedMedicineCopyWith<_LocalizedMedicine> get copyWith => __$LocalizedMedicineCopyWithImpl<_LocalizedMedicine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalizedMedicineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizedMedicine&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.genericName, genericName) || other.genericName == genericName)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.dosageForm, dosageForm) || other.dosageForm == dosageForm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,brandName,genericName,strength,manufacturer,dosageForm);

@override
String toString() {
  return 'LocalizedMedicine(id: $id, slug: $slug, brandName: $brandName, genericName: $genericName, strength: $strength, manufacturer: $manufacturer, dosageForm: $dosageForm)';
}


}

/// @nodoc
abstract mixin class _$LocalizedMedicineCopyWith<$Res> implements $LocalizedMedicineCopyWith<$Res> {
  factory _$LocalizedMedicineCopyWith(_LocalizedMedicine value, $Res Function(_LocalizedMedicine) _then) = __$LocalizedMedicineCopyWithImpl;
@override @useResult
$Res call({
 int id, String slug,@JsonKey(name: 'brand_name') String brandName,@JsonKey(name: 'generic_name') String genericName, String strength, String manufacturer,@JsonKey(name: 'dosage_form') String dosageForm
});




}
/// @nodoc
class __$LocalizedMedicineCopyWithImpl<$Res>
    implements _$LocalizedMedicineCopyWith<$Res> {
  __$LocalizedMedicineCopyWithImpl(this._self, this._then);

  final _LocalizedMedicine _self;
  final $Res Function(_LocalizedMedicine) _then;

/// Create a copy of LocalizedMedicine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? brandName = null,Object? genericName = null,Object? strength = null,Object? manufacturer = null,Object? dosageForm = null,}) {
  return _then(_LocalizedMedicine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,genericName: null == genericName ? _self.genericName : genericName // ignore: cast_nullable_to_non_nullable
as String,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String,manufacturer: null == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String,dosageForm: null == dosageForm ? _self.dosageForm : dosageForm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TemplateMedicine {

 int get id;@JsonKey(name: 'medicine_id') int? get medicineId; LocalizedMedicine get medicine; String get dosage;@JsonKey(name: 'taking_time') String get takingTime; String get volume; String get duration; String get route; String get instruction;
/// Create a copy of TemplateMedicine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateMedicineCopyWith<TemplateMedicine> get copyWith => _$TemplateMedicineCopyWithImpl<TemplateMedicine>(this as TemplateMedicine, _$identity);

  /// Serializes this TemplateMedicine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateMedicine&&(identical(other.id, id) || other.id == id)&&(identical(other.medicineId, medicineId) || other.medicineId == medicineId)&&(identical(other.medicine, medicine) || other.medicine == medicine)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.takingTime, takingTime) || other.takingTime == takingTime)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.route, route) || other.route == route)&&(identical(other.instruction, instruction) || other.instruction == instruction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,medicineId,medicine,dosage,takingTime,volume,duration,route,instruction);

@override
String toString() {
  return 'TemplateMedicine(id: $id, medicineId: $medicineId, medicine: $medicine, dosage: $dosage, takingTime: $takingTime, volume: $volume, duration: $duration, route: $route, instruction: $instruction)';
}


}

/// @nodoc
abstract mixin class $TemplateMedicineCopyWith<$Res>  {
  factory $TemplateMedicineCopyWith(TemplateMedicine value, $Res Function(TemplateMedicine) _then) = _$TemplateMedicineCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'medicine_id') int? medicineId, LocalizedMedicine medicine, String dosage,@JsonKey(name: 'taking_time') String takingTime, String volume, String duration, String route, String instruction
});


$LocalizedMedicineCopyWith<$Res> get medicine;

}
/// @nodoc
class _$TemplateMedicineCopyWithImpl<$Res>
    implements $TemplateMedicineCopyWith<$Res> {
  _$TemplateMedicineCopyWithImpl(this._self, this._then);

  final TemplateMedicine _self;
  final $Res Function(TemplateMedicine) _then;

/// Create a copy of TemplateMedicine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? medicineId = freezed,Object? medicine = null,Object? dosage = null,Object? takingTime = null,Object? volume = null,Object? duration = null,Object? route = null,Object? instruction = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,medicineId: freezed == medicineId ? _self.medicineId : medicineId // ignore: cast_nullable_to_non_nullable
as int?,medicine: null == medicine ? _self.medicine : medicine // ignore: cast_nullable_to_non_nullable
as LocalizedMedicine,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,takingTime: null == takingTime ? _self.takingTime : takingTime // ignore: cast_nullable_to_non_nullable
as String,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of TemplateMedicine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedMedicineCopyWith<$Res> get medicine {
  
  return $LocalizedMedicineCopyWith<$Res>(_self.medicine, (value) {
    return _then(_self.copyWith(medicine: value));
  });
}
}


/// Adds pattern-matching-related methods to [TemplateMedicine].
extension TemplateMedicinePatterns on TemplateMedicine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TemplateMedicine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TemplateMedicine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TemplateMedicine value)  $default,){
final _that = this;
switch (_that) {
case _TemplateMedicine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TemplateMedicine value)?  $default,){
final _that = this;
switch (_that) {
case _TemplateMedicine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'medicine_id')  int? medicineId,  LocalizedMedicine medicine,  String dosage, @JsonKey(name: 'taking_time')  String takingTime,  String volume,  String duration,  String route,  String instruction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplateMedicine() when $default != null:
return $default(_that.id,_that.medicineId,_that.medicine,_that.dosage,_that.takingTime,_that.volume,_that.duration,_that.route,_that.instruction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'medicine_id')  int? medicineId,  LocalizedMedicine medicine,  String dosage, @JsonKey(name: 'taking_time')  String takingTime,  String volume,  String duration,  String route,  String instruction)  $default,) {final _that = this;
switch (_that) {
case _TemplateMedicine():
return $default(_that.id,_that.medicineId,_that.medicine,_that.dosage,_that.takingTime,_that.volume,_that.duration,_that.route,_that.instruction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'medicine_id')  int? medicineId,  LocalizedMedicine medicine,  String dosage, @JsonKey(name: 'taking_time')  String takingTime,  String volume,  String duration,  String route,  String instruction)?  $default,) {final _that = this;
switch (_that) {
case _TemplateMedicine() when $default != null:
return $default(_that.id,_that.medicineId,_that.medicine,_that.dosage,_that.takingTime,_that.volume,_that.duration,_that.route,_that.instruction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TemplateMedicine implements TemplateMedicine {
  const _TemplateMedicine({required this.id, @JsonKey(name: 'medicine_id') this.medicineId, required this.medicine, required this.dosage, @JsonKey(name: 'taking_time') required this.takingTime, required this.volume, required this.duration, required this.route, required this.instruction});
  factory _TemplateMedicine.fromJson(Map<String, dynamic> json) => _$TemplateMedicineFromJson(json);

@override final  int id;
@override@JsonKey(name: 'medicine_id') final  int? medicineId;
@override final  LocalizedMedicine medicine;
@override final  String dosage;
@override@JsonKey(name: 'taking_time') final  String takingTime;
@override final  String volume;
@override final  String duration;
@override final  String route;
@override final  String instruction;

/// Create a copy of TemplateMedicine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplateMedicineCopyWith<_TemplateMedicine> get copyWith => __$TemplateMedicineCopyWithImpl<_TemplateMedicine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemplateMedicineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplateMedicine&&(identical(other.id, id) || other.id == id)&&(identical(other.medicineId, medicineId) || other.medicineId == medicineId)&&(identical(other.medicine, medicine) || other.medicine == medicine)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.takingTime, takingTime) || other.takingTime == takingTime)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.route, route) || other.route == route)&&(identical(other.instruction, instruction) || other.instruction == instruction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,medicineId,medicine,dosage,takingTime,volume,duration,route,instruction);

@override
String toString() {
  return 'TemplateMedicine(id: $id, medicineId: $medicineId, medicine: $medicine, dosage: $dosage, takingTime: $takingTime, volume: $volume, duration: $duration, route: $route, instruction: $instruction)';
}


}

/// @nodoc
abstract mixin class _$TemplateMedicineCopyWith<$Res> implements $TemplateMedicineCopyWith<$Res> {
  factory _$TemplateMedicineCopyWith(_TemplateMedicine value, $Res Function(_TemplateMedicine) _then) = __$TemplateMedicineCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'medicine_id') int? medicineId, LocalizedMedicine medicine, String dosage,@JsonKey(name: 'taking_time') String takingTime, String volume, String duration, String route, String instruction
});


@override $LocalizedMedicineCopyWith<$Res> get medicine;

}
/// @nodoc
class __$TemplateMedicineCopyWithImpl<$Res>
    implements _$TemplateMedicineCopyWith<$Res> {
  __$TemplateMedicineCopyWithImpl(this._self, this._then);

  final _TemplateMedicine _self;
  final $Res Function(_TemplateMedicine) _then;

/// Create a copy of TemplateMedicine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? medicineId = freezed,Object? medicine = null,Object? dosage = null,Object? takingTime = null,Object? volume = null,Object? duration = null,Object? route = null,Object? instruction = null,}) {
  return _then(_TemplateMedicine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,medicineId: freezed == medicineId ? _self.medicineId : medicineId // ignore: cast_nullable_to_non_nullable
as int?,medicine: null == medicine ? _self.medicine : medicine // ignore: cast_nullable_to_non_nullable
as LocalizedMedicine,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,takingTime: null == takingTime ? _self.takingTime : takingTime // ignore: cast_nullable_to_non_nullable
as String,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of TemplateMedicine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedMedicineCopyWith<$Res> get medicine {
  
  return $LocalizedMedicineCopyWith<$Res>(_self.medicine, (value) {
    return _then(_self.copyWith(medicine: value));
  });
}
}


/// @nodoc
mixin _$PrescriptionTemplate {

 int get id; String get name; List<TemplateMedicine> get medicines; List<int> get investigations; String? get advice;@JsonKey(name: 'next_follow_up') String? get nextFollowUp;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of PrescriptionTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionTemplateCopyWith<PrescriptionTemplate> get copyWith => _$PrescriptionTemplateCopyWithImpl<PrescriptionTemplate>(this as PrescriptionTemplate, _$identity);

  /// Serializes this PrescriptionTemplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.medicines, medicines)&&const DeepCollectionEquality().equals(other.investigations, investigations)&&(identical(other.advice, advice) || other.advice == advice)&&(identical(other.nextFollowUp, nextFollowUp) || other.nextFollowUp == nextFollowUp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(medicines),const DeepCollectionEquality().hash(investigations),advice,nextFollowUp,createdAt,updatedAt);

@override
String toString() {
  return 'PrescriptionTemplate(id: $id, name: $name, medicines: $medicines, investigations: $investigations, advice: $advice, nextFollowUp: $nextFollowUp, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PrescriptionTemplateCopyWith<$Res>  {
  factory $PrescriptionTemplateCopyWith(PrescriptionTemplate value, $Res Function(PrescriptionTemplate) _then) = _$PrescriptionTemplateCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<TemplateMedicine> medicines, List<int> investigations, String? advice,@JsonKey(name: 'next_follow_up') String? nextFollowUp,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$PrescriptionTemplateCopyWithImpl<$Res>
    implements $PrescriptionTemplateCopyWith<$Res> {
  _$PrescriptionTemplateCopyWithImpl(this._self, this._then);

  final PrescriptionTemplate _self;
  final $Res Function(PrescriptionTemplate) _then;

/// Create a copy of PrescriptionTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? medicines = null,Object? investigations = null,Object? advice = freezed,Object? nextFollowUp = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,medicines: null == medicines ? _self.medicines : medicines // ignore: cast_nullable_to_non_nullable
as List<TemplateMedicine>,investigations: null == investigations ? _self.investigations : investigations // ignore: cast_nullable_to_non_nullable
as List<int>,advice: freezed == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as String?,nextFollowUp: freezed == nextFollowUp ? _self.nextFollowUp : nextFollowUp // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionTemplate].
extension PrescriptionTemplatePatterns on PrescriptionTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionTemplate value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  List<TemplateMedicine> medicines,  List<int> investigations,  String? advice, @JsonKey(name: 'next_follow_up')  String? nextFollowUp, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionTemplate() when $default != null:
return $default(_that.id,_that.name,_that.medicines,_that.investigations,_that.advice,_that.nextFollowUp,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  List<TemplateMedicine> medicines,  List<int> investigations,  String? advice, @JsonKey(name: 'next_follow_up')  String? nextFollowUp, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionTemplate():
return $default(_that.id,_that.name,_that.medicines,_that.investigations,_that.advice,_that.nextFollowUp,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  List<TemplateMedicine> medicines,  List<int> investigations,  String? advice, @JsonKey(name: 'next_follow_up')  String? nextFollowUp, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionTemplate() when $default != null:
return $default(_that.id,_that.name,_that.medicines,_that.investigations,_that.advice,_that.nextFollowUp,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionTemplate implements PrescriptionTemplate {
  const _PrescriptionTemplate({required this.id, required this.name, required final  List<TemplateMedicine> medicines, required final  List<int> investigations, required this.advice, @JsonKey(name: 'next_follow_up') this.nextFollowUp, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _medicines = medicines,_investigations = investigations;
  factory _PrescriptionTemplate.fromJson(Map<String, dynamic> json) => _$PrescriptionTemplateFromJson(json);

@override final  int id;
@override final  String name;
 final  List<TemplateMedicine> _medicines;
@override List<TemplateMedicine> get medicines {
  if (_medicines is EqualUnmodifiableListView) return _medicines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medicines);
}

 final  List<int> _investigations;
@override List<int> get investigations {
  if (_investigations is EqualUnmodifiableListView) return _investigations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_investigations);
}

@override final  String? advice;
@override@JsonKey(name: 'next_follow_up') final  String? nextFollowUp;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of PrescriptionTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionTemplateCopyWith<_PrescriptionTemplate> get copyWith => __$PrescriptionTemplateCopyWithImpl<_PrescriptionTemplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionTemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._medicines, _medicines)&&const DeepCollectionEquality().equals(other._investigations, _investigations)&&(identical(other.advice, advice) || other.advice == advice)&&(identical(other.nextFollowUp, nextFollowUp) || other.nextFollowUp == nextFollowUp)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_medicines),const DeepCollectionEquality().hash(_investigations),advice,nextFollowUp,createdAt,updatedAt);

@override
String toString() {
  return 'PrescriptionTemplate(id: $id, name: $name, medicines: $medicines, investigations: $investigations, advice: $advice, nextFollowUp: $nextFollowUp, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionTemplateCopyWith<$Res> implements $PrescriptionTemplateCopyWith<$Res> {
  factory _$PrescriptionTemplateCopyWith(_PrescriptionTemplate value, $Res Function(_PrescriptionTemplate) _then) = __$PrescriptionTemplateCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<TemplateMedicine> medicines, List<int> investigations, String? advice,@JsonKey(name: 'next_follow_up') String? nextFollowUp,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$PrescriptionTemplateCopyWithImpl<$Res>
    implements _$PrescriptionTemplateCopyWith<$Res> {
  __$PrescriptionTemplateCopyWithImpl(this._self, this._then);

  final _PrescriptionTemplate _self;
  final $Res Function(_PrescriptionTemplate) _then;

/// Create a copy of PrescriptionTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? medicines = null,Object? investigations = null,Object? advice = freezed,Object? nextFollowUp = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_PrescriptionTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,medicines: null == medicines ? _self._medicines : medicines // ignore: cast_nullable_to_non_nullable
as List<TemplateMedicine>,investigations: null == investigations ? _self._investigations : investigations // ignore: cast_nullable_to_non_nullable
as List<int>,advice: freezed == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as String?,nextFollowUp: freezed == nextFollowUp ? _self.nextFollowUp : nextFollowUp // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
