// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateProfileRequest {

@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'full_name_local') String? get fullNameLocal;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'phone_number_local') String? get phoneNumberLocal; String? get designation;@JsonKey(name: 'designation_local') String? get designationLocal; String? get expertise;@JsonKey(name: 'expertise_local') String? get expertiseLocal;@JsonKey(name: 'working_place') String? get workingPlace;@JsonKey(name: 'working_place_local') String? get workingPlaceLocal; dynamic get gender;
/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileRequestCopyWith<UpdateProfileRequest> get copyWith => _$UpdateProfileRequestCopyWithImpl<UpdateProfileRequest>(this as UpdateProfileRequest, _$identity);

  /// Serializes this UpdateProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.fullNameLocal, fullNameLocal) || other.fullNameLocal == fullNameLocal)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberLocal, phoneNumberLocal) || other.phoneNumberLocal == phoneNumberLocal)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.designationLocal, designationLocal) || other.designationLocal == designationLocal)&&(identical(other.expertise, expertise) || other.expertise == expertise)&&(identical(other.expertiseLocal, expertiseLocal) || other.expertiseLocal == expertiseLocal)&&(identical(other.workingPlace, workingPlace) || other.workingPlace == workingPlace)&&(identical(other.workingPlaceLocal, workingPlaceLocal) || other.workingPlaceLocal == workingPlaceLocal)&&const DeepCollectionEquality().equals(other.gender, gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,fullNameLocal,phoneNumber,phoneNumberLocal,designation,designationLocal,expertise,expertiseLocal,workingPlace,workingPlaceLocal,const DeepCollectionEquality().hash(gender));

@override
String toString() {
  return 'UpdateProfileRequest(fullName: $fullName, fullNameLocal: $fullNameLocal, phoneNumber: $phoneNumber, phoneNumberLocal: $phoneNumberLocal, designation: $designation, designationLocal: $designationLocal, expertise: $expertise, expertiseLocal: $expertiseLocal, workingPlace: $workingPlace, workingPlaceLocal: $workingPlaceLocal, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileRequestCopyWith<$Res>  {
  factory $UpdateProfileRequestCopyWith(UpdateProfileRequest value, $Res Function(UpdateProfileRequest) _then) = _$UpdateProfileRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'full_name_local') String? fullNameLocal,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'phone_number_local') String? phoneNumberLocal, String? designation,@JsonKey(name: 'designation_local') String? designationLocal, String? expertise,@JsonKey(name: 'expertise_local') String? expertiseLocal,@JsonKey(name: 'working_place') String? workingPlace,@JsonKey(name: 'working_place_local') String? workingPlaceLocal, dynamic gender
});




}
/// @nodoc
class _$UpdateProfileRequestCopyWithImpl<$Res>
    implements $UpdateProfileRequestCopyWith<$Res> {
  _$UpdateProfileRequestCopyWithImpl(this._self, this._then);

  final UpdateProfileRequest _self;
  final $Res Function(UpdateProfileRequest) _then;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? fullNameLocal = freezed,Object? phoneNumber = freezed,Object? phoneNumberLocal = freezed,Object? designation = freezed,Object? designationLocal = freezed,Object? expertise = freezed,Object? expertiseLocal = freezed,Object? workingPlace = freezed,Object? workingPlaceLocal = freezed,Object? gender = freezed,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,fullNameLocal: freezed == fullNameLocal ? _self.fullNameLocal : fullNameLocal // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,phoneNumberLocal: freezed == phoneNumberLocal ? _self.phoneNumberLocal : phoneNumberLocal // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,designationLocal: freezed == designationLocal ? _self.designationLocal : designationLocal // ignore: cast_nullable_to_non_nullable
as String?,expertise: freezed == expertise ? _self.expertise : expertise // ignore: cast_nullable_to_non_nullable
as String?,expertiseLocal: freezed == expertiseLocal ? _self.expertiseLocal : expertiseLocal // ignore: cast_nullable_to_non_nullable
as String?,workingPlace: freezed == workingPlace ? _self.workingPlace : workingPlace // ignore: cast_nullable_to_non_nullable
as String?,workingPlaceLocal: freezed == workingPlaceLocal ? _self.workingPlaceLocal : workingPlaceLocal // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProfileRequest].
extension UpdateProfileRequestPatterns on UpdateProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'full_name_local')  String? fullNameLocal, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'phone_number_local')  String? phoneNumberLocal,  String? designation, @JsonKey(name: 'designation_local')  String? designationLocal,  String? expertise, @JsonKey(name: 'expertise_local')  String? expertiseLocal, @JsonKey(name: 'working_place')  String? workingPlace, @JsonKey(name: 'working_place_local')  String? workingPlaceLocal,  dynamic gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
return $default(_that.fullName,_that.fullNameLocal,_that.phoneNumber,_that.phoneNumberLocal,_that.designation,_that.designationLocal,_that.expertise,_that.expertiseLocal,_that.workingPlace,_that.workingPlaceLocal,_that.gender);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'full_name_local')  String? fullNameLocal, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'phone_number_local')  String? phoneNumberLocal,  String? designation, @JsonKey(name: 'designation_local')  String? designationLocal,  String? expertise, @JsonKey(name: 'expertise_local')  String? expertiseLocal, @JsonKey(name: 'working_place')  String? workingPlace, @JsonKey(name: 'working_place_local')  String? workingPlaceLocal,  dynamic gender)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileRequest():
return $default(_that.fullName,_that.fullNameLocal,_that.phoneNumber,_that.phoneNumberLocal,_that.designation,_that.designationLocal,_that.expertise,_that.expertiseLocal,_that.workingPlace,_that.workingPlaceLocal,_that.gender);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'full_name_local')  String? fullNameLocal, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'phone_number_local')  String? phoneNumberLocal,  String? designation, @JsonKey(name: 'designation_local')  String? designationLocal,  String? expertise, @JsonKey(name: 'expertise_local')  String? expertiseLocal, @JsonKey(name: 'working_place')  String? workingPlace, @JsonKey(name: 'working_place_local')  String? workingPlaceLocal,  dynamic gender)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
return $default(_that.fullName,_that.fullNameLocal,_that.phoneNumber,_that.phoneNumberLocal,_that.designation,_that.designationLocal,_that.expertise,_that.expertiseLocal,_that.workingPlace,_that.workingPlaceLocal,_that.gender);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProfileRequest implements UpdateProfileRequest {
  const _UpdateProfileRequest({@JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'full_name_local') this.fullNameLocal, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'phone_number_local') this.phoneNumberLocal, this.designation, @JsonKey(name: 'designation_local') this.designationLocal, this.expertise, @JsonKey(name: 'expertise_local') this.expertiseLocal, @JsonKey(name: 'working_place') this.workingPlace, @JsonKey(name: 'working_place_local') this.workingPlaceLocal, this.gender});
  factory _UpdateProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateProfileRequestFromJson(json);

@override@JsonKey(name: 'full_name') final  String? fullName;
@override@JsonKey(name: 'full_name_local') final  String? fullNameLocal;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'phone_number_local') final  String? phoneNumberLocal;
@override final  String? designation;
@override@JsonKey(name: 'designation_local') final  String? designationLocal;
@override final  String? expertise;
@override@JsonKey(name: 'expertise_local') final  String? expertiseLocal;
@override@JsonKey(name: 'working_place') final  String? workingPlace;
@override@JsonKey(name: 'working_place_local') final  String? workingPlaceLocal;
@override final  dynamic gender;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileRequestCopyWith<_UpdateProfileRequest> get copyWith => __$UpdateProfileRequestCopyWithImpl<_UpdateProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.fullNameLocal, fullNameLocal) || other.fullNameLocal == fullNameLocal)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberLocal, phoneNumberLocal) || other.phoneNumberLocal == phoneNumberLocal)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.designationLocal, designationLocal) || other.designationLocal == designationLocal)&&(identical(other.expertise, expertise) || other.expertise == expertise)&&(identical(other.expertiseLocal, expertiseLocal) || other.expertiseLocal == expertiseLocal)&&(identical(other.workingPlace, workingPlace) || other.workingPlace == workingPlace)&&(identical(other.workingPlaceLocal, workingPlaceLocal) || other.workingPlaceLocal == workingPlaceLocal)&&const DeepCollectionEquality().equals(other.gender, gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,fullNameLocal,phoneNumber,phoneNumberLocal,designation,designationLocal,expertise,expertiseLocal,workingPlace,workingPlaceLocal,const DeepCollectionEquality().hash(gender));

@override
String toString() {
  return 'UpdateProfileRequest(fullName: $fullName, fullNameLocal: $fullNameLocal, phoneNumber: $phoneNumber, phoneNumberLocal: $phoneNumberLocal, designation: $designation, designationLocal: $designationLocal, expertise: $expertise, expertiseLocal: $expertiseLocal, workingPlace: $workingPlace, workingPlaceLocal: $workingPlaceLocal, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileRequestCopyWith<$Res> implements $UpdateProfileRequestCopyWith<$Res> {
  factory _$UpdateProfileRequestCopyWith(_UpdateProfileRequest value, $Res Function(_UpdateProfileRequest) _then) = __$UpdateProfileRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'full_name_local') String? fullNameLocal,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'phone_number_local') String? phoneNumberLocal, String? designation,@JsonKey(name: 'designation_local') String? designationLocal, String? expertise,@JsonKey(name: 'expertise_local') String? expertiseLocal,@JsonKey(name: 'working_place') String? workingPlace,@JsonKey(name: 'working_place_local') String? workingPlaceLocal, dynamic gender
});




}
/// @nodoc
class __$UpdateProfileRequestCopyWithImpl<$Res>
    implements _$UpdateProfileRequestCopyWith<$Res> {
  __$UpdateProfileRequestCopyWithImpl(this._self, this._then);

  final _UpdateProfileRequest _self;
  final $Res Function(_UpdateProfileRequest) _then;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? fullNameLocal = freezed,Object? phoneNumber = freezed,Object? phoneNumberLocal = freezed,Object? designation = freezed,Object? designationLocal = freezed,Object? expertise = freezed,Object? expertiseLocal = freezed,Object? workingPlace = freezed,Object? workingPlaceLocal = freezed,Object? gender = freezed,}) {
  return _then(_UpdateProfileRequest(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,fullNameLocal: freezed == fullNameLocal ? _self.fullNameLocal : fullNameLocal // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,phoneNumberLocal: freezed == phoneNumberLocal ? _self.phoneNumberLocal : phoneNumberLocal // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,designationLocal: freezed == designationLocal ? _self.designationLocal : designationLocal // ignore: cast_nullable_to_non_nullable
as String?,expertise: freezed == expertise ? _self.expertise : expertise // ignore: cast_nullable_to_non_nullable
as String?,expertiseLocal: freezed == expertiseLocal ? _self.expertiseLocal : expertiseLocal // ignore: cast_nullable_to_non_nullable
as String?,workingPlace: freezed == workingPlace ? _self.workingPlace : workingPlace // ignore: cast_nullable_to_non_nullable
as String?,workingPlaceLocal: freezed == workingPlaceLocal ? _self.workingPlaceLocal : workingPlaceLocal // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
