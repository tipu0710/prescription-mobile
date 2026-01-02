// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_template_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTemplateMedicine {

@JsonKey(name: 'medicine_id') int get medicineId; String get dosage;@JsonKey(name: 'taking_time') String get takingTime; String get duration; String get route; String get instruction;
/// Create a copy of CreateTemplateMedicine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTemplateMedicineCopyWith<CreateTemplateMedicine> get copyWith => _$CreateTemplateMedicineCopyWithImpl<CreateTemplateMedicine>(this as CreateTemplateMedicine, _$identity);

  /// Serializes this CreateTemplateMedicine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTemplateMedicine&&(identical(other.medicineId, medicineId) || other.medicineId == medicineId)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.takingTime, takingTime) || other.takingTime == takingTime)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.route, route) || other.route == route)&&(identical(other.instruction, instruction) || other.instruction == instruction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medicineId,dosage,takingTime,duration,route,instruction);

@override
String toString() {
  return 'CreateTemplateMedicine(medicineId: $medicineId, dosage: $dosage, takingTime: $takingTime, duration: $duration, route: $route, instruction: $instruction)';
}


}

/// @nodoc
abstract mixin class $CreateTemplateMedicineCopyWith<$Res>  {
  factory $CreateTemplateMedicineCopyWith(CreateTemplateMedicine value, $Res Function(CreateTemplateMedicine) _then) = _$CreateTemplateMedicineCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'medicine_id') int medicineId, String dosage,@JsonKey(name: 'taking_time') String takingTime, String duration, String route, String instruction
});




}
/// @nodoc
class _$CreateTemplateMedicineCopyWithImpl<$Res>
    implements $CreateTemplateMedicineCopyWith<$Res> {
  _$CreateTemplateMedicineCopyWithImpl(this._self, this._then);

  final CreateTemplateMedicine _self;
  final $Res Function(CreateTemplateMedicine) _then;

/// Create a copy of CreateTemplateMedicine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? medicineId = null,Object? dosage = null,Object? takingTime = null,Object? duration = null,Object? route = null,Object? instruction = null,}) {
  return _then(_self.copyWith(
medicineId: null == medicineId ? _self.medicineId : medicineId // ignore: cast_nullable_to_non_nullable
as int,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,takingTime: null == takingTime ? _self.takingTime : takingTime // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTemplateMedicine].
extension CreateTemplateMedicinePatterns on CreateTemplateMedicine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTemplateMedicine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTemplateMedicine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTemplateMedicine value)  $default,){
final _that = this;
switch (_that) {
case _CreateTemplateMedicine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTemplateMedicine value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTemplateMedicine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'medicine_id')  int medicineId,  String dosage, @JsonKey(name: 'taking_time')  String takingTime,  String duration,  String route,  String instruction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTemplateMedicine() when $default != null:
return $default(_that.medicineId,_that.dosage,_that.takingTime,_that.duration,_that.route,_that.instruction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'medicine_id')  int medicineId,  String dosage, @JsonKey(name: 'taking_time')  String takingTime,  String duration,  String route,  String instruction)  $default,) {final _that = this;
switch (_that) {
case _CreateTemplateMedicine():
return $default(_that.medicineId,_that.dosage,_that.takingTime,_that.duration,_that.route,_that.instruction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'medicine_id')  int medicineId,  String dosage, @JsonKey(name: 'taking_time')  String takingTime,  String duration,  String route,  String instruction)?  $default,) {final _that = this;
switch (_that) {
case _CreateTemplateMedicine() when $default != null:
return $default(_that.medicineId,_that.dosage,_that.takingTime,_that.duration,_that.route,_that.instruction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTemplateMedicine implements CreateTemplateMedicine {
  const _CreateTemplateMedicine({@JsonKey(name: 'medicine_id') required this.medicineId, required this.dosage, @JsonKey(name: 'taking_time') required this.takingTime, required this.duration, required this.route, required this.instruction});
  factory _CreateTemplateMedicine.fromJson(Map<String, dynamic> json) => _$CreateTemplateMedicineFromJson(json);

@override@JsonKey(name: 'medicine_id') final  int medicineId;
@override final  String dosage;
@override@JsonKey(name: 'taking_time') final  String takingTime;
@override final  String duration;
@override final  String route;
@override final  String instruction;

/// Create a copy of CreateTemplateMedicine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTemplateMedicineCopyWith<_CreateTemplateMedicine> get copyWith => __$CreateTemplateMedicineCopyWithImpl<_CreateTemplateMedicine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTemplateMedicineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTemplateMedicine&&(identical(other.medicineId, medicineId) || other.medicineId == medicineId)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.takingTime, takingTime) || other.takingTime == takingTime)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.route, route) || other.route == route)&&(identical(other.instruction, instruction) || other.instruction == instruction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,medicineId,dosage,takingTime,duration,route,instruction);

@override
String toString() {
  return 'CreateTemplateMedicine(medicineId: $medicineId, dosage: $dosage, takingTime: $takingTime, duration: $duration, route: $route, instruction: $instruction)';
}


}

/// @nodoc
abstract mixin class _$CreateTemplateMedicineCopyWith<$Res> implements $CreateTemplateMedicineCopyWith<$Res> {
  factory _$CreateTemplateMedicineCopyWith(_CreateTemplateMedicine value, $Res Function(_CreateTemplateMedicine) _then) = __$CreateTemplateMedicineCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'medicine_id') int medicineId, String dosage,@JsonKey(name: 'taking_time') String takingTime, String duration, String route, String instruction
});




}
/// @nodoc
class __$CreateTemplateMedicineCopyWithImpl<$Res>
    implements _$CreateTemplateMedicineCopyWith<$Res> {
  __$CreateTemplateMedicineCopyWithImpl(this._self, this._then);

  final _CreateTemplateMedicine _self;
  final $Res Function(_CreateTemplateMedicine) _then;

/// Create a copy of CreateTemplateMedicine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? medicineId = null,Object? dosage = null,Object? takingTime = null,Object? duration = null,Object? route = null,Object? instruction = null,}) {
  return _then(_CreateTemplateMedicine(
medicineId: null == medicineId ? _self.medicineId : medicineId // ignore: cast_nullable_to_non_nullable
as int,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,takingTime: null == takingTime ? _self.takingTime : takingTime // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateTemplateRequest {

 String get name; List<CreateTemplateMedicine> get medicines; List<int> get investigations; String? get advice;@JsonKey(name: 'next_follow_up') String? get nextFollowUp;
/// Create a copy of CreateTemplateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTemplateRequestCopyWith<CreateTemplateRequest> get copyWith => _$CreateTemplateRequestCopyWithImpl<CreateTemplateRequest>(this as CreateTemplateRequest, _$identity);

  /// Serializes this CreateTemplateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTemplateRequest&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.medicines, medicines)&&const DeepCollectionEquality().equals(other.investigations, investigations)&&(identical(other.advice, advice) || other.advice == advice)&&(identical(other.nextFollowUp, nextFollowUp) || other.nextFollowUp == nextFollowUp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(medicines),const DeepCollectionEquality().hash(investigations),advice,nextFollowUp);

@override
String toString() {
  return 'CreateTemplateRequest(name: $name, medicines: $medicines, investigations: $investigations, advice: $advice, nextFollowUp: $nextFollowUp)';
}


}

/// @nodoc
abstract mixin class $CreateTemplateRequestCopyWith<$Res>  {
  factory $CreateTemplateRequestCopyWith(CreateTemplateRequest value, $Res Function(CreateTemplateRequest) _then) = _$CreateTemplateRequestCopyWithImpl;
@useResult
$Res call({
 String name, List<CreateTemplateMedicine> medicines, List<int> investigations, String? advice,@JsonKey(name: 'next_follow_up') String? nextFollowUp
});




}
/// @nodoc
class _$CreateTemplateRequestCopyWithImpl<$Res>
    implements $CreateTemplateRequestCopyWith<$Res> {
  _$CreateTemplateRequestCopyWithImpl(this._self, this._then);

  final CreateTemplateRequest _self;
  final $Res Function(CreateTemplateRequest) _then;

/// Create a copy of CreateTemplateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? medicines = null,Object? investigations = null,Object? advice = freezed,Object? nextFollowUp = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,medicines: null == medicines ? _self.medicines : medicines // ignore: cast_nullable_to_non_nullable
as List<CreateTemplateMedicine>,investigations: null == investigations ? _self.investigations : investigations // ignore: cast_nullable_to_non_nullable
as List<int>,advice: freezed == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as String?,nextFollowUp: freezed == nextFollowUp ? _self.nextFollowUp : nextFollowUp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTemplateRequest].
extension CreateTemplateRequestPatterns on CreateTemplateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTemplateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTemplateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTemplateRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateTemplateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTemplateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTemplateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<CreateTemplateMedicine> medicines,  List<int> investigations,  String? advice, @JsonKey(name: 'next_follow_up')  String? nextFollowUp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTemplateRequest() when $default != null:
return $default(_that.name,_that.medicines,_that.investigations,_that.advice,_that.nextFollowUp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<CreateTemplateMedicine> medicines,  List<int> investigations,  String? advice, @JsonKey(name: 'next_follow_up')  String? nextFollowUp)  $default,) {final _that = this;
switch (_that) {
case _CreateTemplateRequest():
return $default(_that.name,_that.medicines,_that.investigations,_that.advice,_that.nextFollowUp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<CreateTemplateMedicine> medicines,  List<int> investigations,  String? advice, @JsonKey(name: 'next_follow_up')  String? nextFollowUp)?  $default,) {final _that = this;
switch (_that) {
case _CreateTemplateRequest() when $default != null:
return $default(_that.name,_that.medicines,_that.investigations,_that.advice,_that.nextFollowUp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTemplateRequest implements CreateTemplateRequest {
  const _CreateTemplateRequest({required this.name, required final  List<CreateTemplateMedicine> medicines, required final  List<int> investigations, required this.advice, @JsonKey(name: 'next_follow_up') this.nextFollowUp}): _medicines = medicines,_investigations = investigations;
  factory _CreateTemplateRequest.fromJson(Map<String, dynamic> json) => _$CreateTemplateRequestFromJson(json);

@override final  String name;
 final  List<CreateTemplateMedicine> _medicines;
@override List<CreateTemplateMedicine> get medicines {
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

/// Create a copy of CreateTemplateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTemplateRequestCopyWith<_CreateTemplateRequest> get copyWith => __$CreateTemplateRequestCopyWithImpl<_CreateTemplateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTemplateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTemplateRequest&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._medicines, _medicines)&&const DeepCollectionEquality().equals(other._investigations, _investigations)&&(identical(other.advice, advice) || other.advice == advice)&&(identical(other.nextFollowUp, nextFollowUp) || other.nextFollowUp == nextFollowUp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_medicines),const DeepCollectionEquality().hash(_investigations),advice,nextFollowUp);

@override
String toString() {
  return 'CreateTemplateRequest(name: $name, medicines: $medicines, investigations: $investigations, advice: $advice, nextFollowUp: $nextFollowUp)';
}


}

/// @nodoc
abstract mixin class _$CreateTemplateRequestCopyWith<$Res> implements $CreateTemplateRequestCopyWith<$Res> {
  factory _$CreateTemplateRequestCopyWith(_CreateTemplateRequest value, $Res Function(_CreateTemplateRequest) _then) = __$CreateTemplateRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, List<CreateTemplateMedicine> medicines, List<int> investigations, String? advice,@JsonKey(name: 'next_follow_up') String? nextFollowUp
});




}
/// @nodoc
class __$CreateTemplateRequestCopyWithImpl<$Res>
    implements _$CreateTemplateRequestCopyWith<$Res> {
  __$CreateTemplateRequestCopyWithImpl(this._self, this._then);

  final _CreateTemplateRequest _self;
  final $Res Function(_CreateTemplateRequest) _then;

/// Create a copy of CreateTemplateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? medicines = null,Object? investigations = null,Object? advice = freezed,Object? nextFollowUp = freezed,}) {
  return _then(_CreateTemplateRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,medicines: null == medicines ? _self._medicines : medicines // ignore: cast_nullable_to_non_nullable
as List<CreateTemplateMedicine>,investigations: null == investigations ? _self._investigations : investigations // ignore: cast_nullable_to_non_nullable
as List<int>,advice: freezed == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as String?,nextFollowUp: freezed == nextFollowUp ? _self.nextFollowUp : nextFollowUp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
