// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

@JsonKey(name: 'email') String get email;@JsonKey(name: 'bmdc_number') String get bmdcNumber;@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'full_name_local') String? get fullNameLocal;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'phone_number_local') String? get phoneNumberLocal; String? get designation;@JsonKey(name: 'designation_local') String? get designationLocal; String? get expertise;@JsonKey(name: 'expertise_local') String? get expertiseLocal;@JsonKey(name: 'working_place') String? get workingPlace;@JsonKey(name: 'working_place_local') String? get workingPlaceLocal; dynamic get gender;// Handling oneOf enum/blank as dynamic or String for now
@JsonKey(name: 'profile_picture') String? get profilePicture;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.email, email) || other.email == email)&&(identical(other.bmdcNumber, bmdcNumber) || other.bmdcNumber == bmdcNumber)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.fullNameLocal, fullNameLocal) || other.fullNameLocal == fullNameLocal)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberLocal, phoneNumberLocal) || other.phoneNumberLocal == phoneNumberLocal)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.designationLocal, designationLocal) || other.designationLocal == designationLocal)&&(identical(other.expertise, expertise) || other.expertise == expertise)&&(identical(other.expertiseLocal, expertiseLocal) || other.expertiseLocal == expertiseLocal)&&(identical(other.workingPlace, workingPlace) || other.workingPlace == workingPlace)&&(identical(other.workingPlaceLocal, workingPlaceLocal) || other.workingPlaceLocal == workingPlaceLocal)&&const DeepCollectionEquality().equals(other.gender, gender)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,bmdcNumber,fullName,fullNameLocal,phoneNumber,phoneNumberLocal,designation,designationLocal,expertise,expertiseLocal,workingPlace,workingPlaceLocal,const DeepCollectionEquality().hash(gender),profilePicture);

@override
String toString() {
  return 'UserProfile(email: $email, bmdcNumber: $bmdcNumber, fullName: $fullName, fullNameLocal: $fullNameLocal, phoneNumber: $phoneNumber, phoneNumberLocal: $phoneNumberLocal, designation: $designation, designationLocal: $designationLocal, expertise: $expertise, expertiseLocal: $expertiseLocal, workingPlace: $workingPlace, workingPlaceLocal: $workingPlaceLocal, gender: $gender, profilePicture: $profilePicture)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'email') String email,@JsonKey(name: 'bmdc_number') String bmdcNumber,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'full_name_local') String? fullNameLocal,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'phone_number_local') String? phoneNumberLocal, String? designation,@JsonKey(name: 'designation_local') String? designationLocal, String? expertise,@JsonKey(name: 'expertise_local') String? expertiseLocal,@JsonKey(name: 'working_place') String? workingPlace,@JsonKey(name: 'working_place_local') String? workingPlaceLocal, dynamic gender,@JsonKey(name: 'profile_picture') String? profilePicture
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? bmdcNumber = null,Object? fullName = freezed,Object? fullNameLocal = freezed,Object? phoneNumber = freezed,Object? phoneNumberLocal = freezed,Object? designation = freezed,Object? designationLocal = freezed,Object? expertise = freezed,Object? expertiseLocal = freezed,Object? workingPlace = freezed,Object? workingPlaceLocal = freezed,Object? gender = freezed,Object? profilePicture = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,bmdcNumber: null == bmdcNumber ? _self.bmdcNumber : bmdcNumber // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
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
as dynamic,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'email')  String email, @JsonKey(name: 'bmdc_number')  String bmdcNumber, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'full_name_local')  String? fullNameLocal, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'phone_number_local')  String? phoneNumberLocal,  String? designation, @JsonKey(name: 'designation_local')  String? designationLocal,  String? expertise, @JsonKey(name: 'expertise_local')  String? expertiseLocal, @JsonKey(name: 'working_place')  String? workingPlace, @JsonKey(name: 'working_place_local')  String? workingPlaceLocal,  dynamic gender, @JsonKey(name: 'profile_picture')  String? profilePicture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.email,_that.bmdcNumber,_that.fullName,_that.fullNameLocal,_that.phoneNumber,_that.phoneNumberLocal,_that.designation,_that.designationLocal,_that.expertise,_that.expertiseLocal,_that.workingPlace,_that.workingPlaceLocal,_that.gender,_that.profilePicture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'email')  String email, @JsonKey(name: 'bmdc_number')  String bmdcNumber, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'full_name_local')  String? fullNameLocal, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'phone_number_local')  String? phoneNumberLocal,  String? designation, @JsonKey(name: 'designation_local')  String? designationLocal,  String? expertise, @JsonKey(name: 'expertise_local')  String? expertiseLocal, @JsonKey(name: 'working_place')  String? workingPlace, @JsonKey(name: 'working_place_local')  String? workingPlaceLocal,  dynamic gender, @JsonKey(name: 'profile_picture')  String? profilePicture)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.email,_that.bmdcNumber,_that.fullName,_that.fullNameLocal,_that.phoneNumber,_that.phoneNumberLocal,_that.designation,_that.designationLocal,_that.expertise,_that.expertiseLocal,_that.workingPlace,_that.workingPlaceLocal,_that.gender,_that.profilePicture);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'email')  String email, @JsonKey(name: 'bmdc_number')  String bmdcNumber, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'full_name_local')  String? fullNameLocal, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'phone_number_local')  String? phoneNumberLocal,  String? designation, @JsonKey(name: 'designation_local')  String? designationLocal,  String? expertise, @JsonKey(name: 'expertise_local')  String? expertiseLocal, @JsonKey(name: 'working_place')  String? workingPlace, @JsonKey(name: 'working_place_local')  String? workingPlaceLocal,  dynamic gender, @JsonKey(name: 'profile_picture')  String? profilePicture)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.email,_that.bmdcNumber,_that.fullName,_that.fullNameLocal,_that.phoneNumber,_that.phoneNumberLocal,_that.designation,_that.designationLocal,_that.expertise,_that.expertiseLocal,_that.workingPlace,_that.workingPlaceLocal,_that.gender,_that.profilePicture);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({@JsonKey(name: 'email') required this.email, @JsonKey(name: 'bmdc_number') required this.bmdcNumber, @JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'full_name_local') this.fullNameLocal, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'phone_number_local') this.phoneNumberLocal, this.designation, @JsonKey(name: 'designation_local') this.designationLocal, this.expertise, @JsonKey(name: 'expertise_local') this.expertiseLocal, @JsonKey(name: 'working_place') this.workingPlace, @JsonKey(name: 'working_place_local') this.workingPlaceLocal, this.gender, @JsonKey(name: 'profile_picture') this.profilePicture});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override@JsonKey(name: 'email') final  String email;
@override@JsonKey(name: 'bmdc_number') final  String bmdcNumber;
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
// Handling oneOf enum/blank as dynamic or String for now
@override@JsonKey(name: 'profile_picture') final  String? profilePicture;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.email, email) || other.email == email)&&(identical(other.bmdcNumber, bmdcNumber) || other.bmdcNumber == bmdcNumber)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.fullNameLocal, fullNameLocal) || other.fullNameLocal == fullNameLocal)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberLocal, phoneNumberLocal) || other.phoneNumberLocal == phoneNumberLocal)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.designationLocal, designationLocal) || other.designationLocal == designationLocal)&&(identical(other.expertise, expertise) || other.expertise == expertise)&&(identical(other.expertiseLocal, expertiseLocal) || other.expertiseLocal == expertiseLocal)&&(identical(other.workingPlace, workingPlace) || other.workingPlace == workingPlace)&&(identical(other.workingPlaceLocal, workingPlaceLocal) || other.workingPlaceLocal == workingPlaceLocal)&&const DeepCollectionEquality().equals(other.gender, gender)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,bmdcNumber,fullName,fullNameLocal,phoneNumber,phoneNumberLocal,designation,designationLocal,expertise,expertiseLocal,workingPlace,workingPlaceLocal,const DeepCollectionEquality().hash(gender),profilePicture);

@override
String toString() {
  return 'UserProfile(email: $email, bmdcNumber: $bmdcNumber, fullName: $fullName, fullNameLocal: $fullNameLocal, phoneNumber: $phoneNumber, phoneNumberLocal: $phoneNumberLocal, designation: $designation, designationLocal: $designationLocal, expertise: $expertise, expertiseLocal: $expertiseLocal, workingPlace: $workingPlace, workingPlaceLocal: $workingPlaceLocal, gender: $gender, profilePicture: $profilePicture)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'email') String email,@JsonKey(name: 'bmdc_number') String bmdcNumber,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'full_name_local') String? fullNameLocal,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'phone_number_local') String? phoneNumberLocal, String? designation,@JsonKey(name: 'designation_local') String? designationLocal, String? expertise,@JsonKey(name: 'expertise_local') String? expertiseLocal,@JsonKey(name: 'working_place') String? workingPlace,@JsonKey(name: 'working_place_local') String? workingPlaceLocal, dynamic gender,@JsonKey(name: 'profile_picture') String? profilePicture
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? bmdcNumber = null,Object? fullName = freezed,Object? fullNameLocal = freezed,Object? phoneNumber = freezed,Object? phoneNumberLocal = freezed,Object? designation = freezed,Object? designationLocal = freezed,Object? expertise = freezed,Object? expertiseLocal = freezed,Object? workingPlace = freezed,Object? workingPlaceLocal = freezed,Object? gender = freezed,Object? profilePicture = freezed,}) {
  return _then(_UserProfile(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,bmdcNumber: null == bmdcNumber ? _self.bmdcNumber : bmdcNumber // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
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
as dynamic,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
