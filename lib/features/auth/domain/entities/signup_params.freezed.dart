// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupParams {

 String get email; String get bmdcNumber; String get password;
/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupParamsCopyWith<SignupParams> get copyWith => _$SignupParamsCopyWithImpl<SignupParams>(this as SignupParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupParams&&(identical(other.email, email) || other.email == email)&&(identical(other.bmdcNumber, bmdcNumber) || other.bmdcNumber == bmdcNumber)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,bmdcNumber,password);

@override
String toString() {
  return 'SignupParams(email: $email, bmdcNumber: $bmdcNumber, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignupParamsCopyWith<$Res>  {
  factory $SignupParamsCopyWith(SignupParams value, $Res Function(SignupParams) _then) = _$SignupParamsCopyWithImpl;
@useResult
$Res call({
 String email, String bmdcNumber, String password
});




}
/// @nodoc
class _$SignupParamsCopyWithImpl<$Res>
    implements $SignupParamsCopyWith<$Res> {
  _$SignupParamsCopyWithImpl(this._self, this._then);

  final SignupParams _self;
  final $Res Function(SignupParams) _then;

/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? bmdcNumber = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,bmdcNumber: null == bmdcNumber ? _self.bmdcNumber : bmdcNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupParams].
extension SignupParamsPatterns on SignupParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupParams value)  $default,){
final _that = this;
switch (_that) {
case _SignupParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupParams value)?  $default,){
final _that = this;
switch (_that) {
case _SignupParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String bmdcNumber,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupParams() when $default != null:
return $default(_that.email,_that.bmdcNumber,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String bmdcNumber,  String password)  $default,) {final _that = this;
switch (_that) {
case _SignupParams():
return $default(_that.email,_that.bmdcNumber,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String bmdcNumber,  String password)?  $default,) {final _that = this;
switch (_that) {
case _SignupParams() when $default != null:
return $default(_that.email,_that.bmdcNumber,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class _SignupParams implements SignupParams {
   _SignupParams({required this.email, required this.bmdcNumber, required this.password});
  

@override final  String email;
@override final  String bmdcNumber;
@override final  String password;

/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupParamsCopyWith<_SignupParams> get copyWith => __$SignupParamsCopyWithImpl<_SignupParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupParams&&(identical(other.email, email) || other.email == email)&&(identical(other.bmdcNumber, bmdcNumber) || other.bmdcNumber == bmdcNumber)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,bmdcNumber,password);

@override
String toString() {
  return 'SignupParams(email: $email, bmdcNumber: $bmdcNumber, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SignupParamsCopyWith<$Res> implements $SignupParamsCopyWith<$Res> {
  factory _$SignupParamsCopyWith(_SignupParams value, $Res Function(_SignupParams) _then) = __$SignupParamsCopyWithImpl;
@override @useResult
$Res call({
 String email, String bmdcNumber, String password
});




}
/// @nodoc
class __$SignupParamsCopyWithImpl<$Res>
    implements _$SignupParamsCopyWith<$Res> {
  __$SignupParamsCopyWithImpl(this._self, this._then);

  final _SignupParams _self;
  final $Res Function(_SignupParams) _then;

/// Create a copy of SignupParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? bmdcNumber = null,Object? password = null,}) {
  return _then(_SignupParams(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,bmdcNumber: null == bmdcNumber ? _self.bmdcNumber : bmdcNumber // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
