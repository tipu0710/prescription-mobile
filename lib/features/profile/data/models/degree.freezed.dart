// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'degree.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Degree {

 int get id;@JsonKey(name: 'degree_name') String get degreeName;@JsonKey(name: 'degree_name_local') String get degreeNameLocal;@JsonKey(name: 'field_of_study') String get fieldOfStudy;@JsonKey(name: 'field_of_study_local') String get fieldOfStudyLocal; String get institution;@JsonKey(name: 'institution_local') String get institutionLocal;
/// Create a copy of Degree
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DegreeCopyWith<Degree> get copyWith => _$DegreeCopyWithImpl<Degree>(this as Degree, _$identity);

  /// Serializes this Degree to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Degree&&(identical(other.id, id) || other.id == id)&&(identical(other.degreeName, degreeName) || other.degreeName == degreeName)&&(identical(other.degreeNameLocal, degreeNameLocal) || other.degreeNameLocal == degreeNameLocal)&&(identical(other.fieldOfStudy, fieldOfStudy) || other.fieldOfStudy == fieldOfStudy)&&(identical(other.fieldOfStudyLocal, fieldOfStudyLocal) || other.fieldOfStudyLocal == fieldOfStudyLocal)&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.institutionLocal, institutionLocal) || other.institutionLocal == institutionLocal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,degreeName,degreeNameLocal,fieldOfStudy,fieldOfStudyLocal,institution,institutionLocal);

@override
String toString() {
  return 'Degree(id: $id, degreeName: $degreeName, degreeNameLocal: $degreeNameLocal, fieldOfStudy: $fieldOfStudy, fieldOfStudyLocal: $fieldOfStudyLocal, institution: $institution, institutionLocal: $institutionLocal)';
}


}

/// @nodoc
abstract mixin class $DegreeCopyWith<$Res>  {
  factory $DegreeCopyWith(Degree value, $Res Function(Degree) _then) = _$DegreeCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'degree_name') String degreeName,@JsonKey(name: 'degree_name_local') String degreeNameLocal,@JsonKey(name: 'field_of_study') String fieldOfStudy,@JsonKey(name: 'field_of_study_local') String fieldOfStudyLocal, String institution,@JsonKey(name: 'institution_local') String institutionLocal
});




}
/// @nodoc
class _$DegreeCopyWithImpl<$Res>
    implements $DegreeCopyWith<$Res> {
  _$DegreeCopyWithImpl(this._self, this._then);

  final Degree _self;
  final $Res Function(Degree) _then;

/// Create a copy of Degree
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? degreeName = null,Object? degreeNameLocal = null,Object? fieldOfStudy = null,Object? fieldOfStudyLocal = null,Object? institution = null,Object? institutionLocal = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,degreeName: null == degreeName ? _self.degreeName : degreeName // ignore: cast_nullable_to_non_nullable
as String,degreeNameLocal: null == degreeNameLocal ? _self.degreeNameLocal : degreeNameLocal // ignore: cast_nullable_to_non_nullable
as String,fieldOfStudy: null == fieldOfStudy ? _self.fieldOfStudy : fieldOfStudy // ignore: cast_nullable_to_non_nullable
as String,fieldOfStudyLocal: null == fieldOfStudyLocal ? _self.fieldOfStudyLocal : fieldOfStudyLocal // ignore: cast_nullable_to_non_nullable
as String,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,institutionLocal: null == institutionLocal ? _self.institutionLocal : institutionLocal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Degree].
extension DegreePatterns on Degree {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Degree value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Degree() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Degree value)  $default,){
final _that = this;
switch (_that) {
case _Degree():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Degree value)?  $default,){
final _that = this;
switch (_that) {
case _Degree() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'degree_name')  String degreeName, @JsonKey(name: 'degree_name_local')  String degreeNameLocal, @JsonKey(name: 'field_of_study')  String fieldOfStudy, @JsonKey(name: 'field_of_study_local')  String fieldOfStudyLocal,  String institution, @JsonKey(name: 'institution_local')  String institutionLocal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Degree() when $default != null:
return $default(_that.id,_that.degreeName,_that.degreeNameLocal,_that.fieldOfStudy,_that.fieldOfStudyLocal,_that.institution,_that.institutionLocal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'degree_name')  String degreeName, @JsonKey(name: 'degree_name_local')  String degreeNameLocal, @JsonKey(name: 'field_of_study')  String fieldOfStudy, @JsonKey(name: 'field_of_study_local')  String fieldOfStudyLocal,  String institution, @JsonKey(name: 'institution_local')  String institutionLocal)  $default,) {final _that = this;
switch (_that) {
case _Degree():
return $default(_that.id,_that.degreeName,_that.degreeNameLocal,_that.fieldOfStudy,_that.fieldOfStudyLocal,_that.institution,_that.institutionLocal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'degree_name')  String degreeName, @JsonKey(name: 'degree_name_local')  String degreeNameLocal, @JsonKey(name: 'field_of_study')  String fieldOfStudy, @JsonKey(name: 'field_of_study_local')  String fieldOfStudyLocal,  String institution, @JsonKey(name: 'institution_local')  String institutionLocal)?  $default,) {final _that = this;
switch (_that) {
case _Degree() when $default != null:
return $default(_that.id,_that.degreeName,_that.degreeNameLocal,_that.fieldOfStudy,_that.fieldOfStudyLocal,_that.institution,_that.institutionLocal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Degree implements Degree {
  const _Degree({required this.id, @JsonKey(name: 'degree_name') required this.degreeName, @JsonKey(name: 'degree_name_local') required this.degreeNameLocal, @JsonKey(name: 'field_of_study') required this.fieldOfStudy, @JsonKey(name: 'field_of_study_local') required this.fieldOfStudyLocal, required this.institution, @JsonKey(name: 'institution_local') required this.institutionLocal});
  factory _Degree.fromJson(Map<String, dynamic> json) => _$DegreeFromJson(json);

@override final  int id;
@override@JsonKey(name: 'degree_name') final  String degreeName;
@override@JsonKey(name: 'degree_name_local') final  String degreeNameLocal;
@override@JsonKey(name: 'field_of_study') final  String fieldOfStudy;
@override@JsonKey(name: 'field_of_study_local') final  String fieldOfStudyLocal;
@override final  String institution;
@override@JsonKey(name: 'institution_local') final  String institutionLocal;

/// Create a copy of Degree
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DegreeCopyWith<_Degree> get copyWith => __$DegreeCopyWithImpl<_Degree>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DegreeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Degree&&(identical(other.id, id) || other.id == id)&&(identical(other.degreeName, degreeName) || other.degreeName == degreeName)&&(identical(other.degreeNameLocal, degreeNameLocal) || other.degreeNameLocal == degreeNameLocal)&&(identical(other.fieldOfStudy, fieldOfStudy) || other.fieldOfStudy == fieldOfStudy)&&(identical(other.fieldOfStudyLocal, fieldOfStudyLocal) || other.fieldOfStudyLocal == fieldOfStudyLocal)&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.institutionLocal, institutionLocal) || other.institutionLocal == institutionLocal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,degreeName,degreeNameLocal,fieldOfStudy,fieldOfStudyLocal,institution,institutionLocal);

@override
String toString() {
  return 'Degree(id: $id, degreeName: $degreeName, degreeNameLocal: $degreeNameLocal, fieldOfStudy: $fieldOfStudy, fieldOfStudyLocal: $fieldOfStudyLocal, institution: $institution, institutionLocal: $institutionLocal)';
}


}

/// @nodoc
abstract mixin class _$DegreeCopyWith<$Res> implements $DegreeCopyWith<$Res> {
  factory _$DegreeCopyWith(_Degree value, $Res Function(_Degree) _then) = __$DegreeCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'degree_name') String degreeName,@JsonKey(name: 'degree_name_local') String degreeNameLocal,@JsonKey(name: 'field_of_study') String fieldOfStudy,@JsonKey(name: 'field_of_study_local') String fieldOfStudyLocal, String institution,@JsonKey(name: 'institution_local') String institutionLocal
});




}
/// @nodoc
class __$DegreeCopyWithImpl<$Res>
    implements _$DegreeCopyWith<$Res> {
  __$DegreeCopyWithImpl(this._self, this._then);

  final _Degree _self;
  final $Res Function(_Degree) _then;

/// Create a copy of Degree
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? degreeName = null,Object? degreeNameLocal = null,Object? fieldOfStudy = null,Object? fieldOfStudyLocal = null,Object? institution = null,Object? institutionLocal = null,}) {
  return _then(_Degree(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,degreeName: null == degreeName ? _self.degreeName : degreeName // ignore: cast_nullable_to_non_nullable
as String,degreeNameLocal: null == degreeNameLocal ? _self.degreeNameLocal : degreeNameLocal // ignore: cast_nullable_to_non_nullable
as String,fieldOfStudy: null == fieldOfStudy ? _self.fieldOfStudy : fieldOfStudy // ignore: cast_nullable_to_non_nullable
as String,fieldOfStudyLocal: null == fieldOfStudyLocal ? _self.fieldOfStudyLocal : fieldOfStudyLocal // ignore: cast_nullable_to_non_nullable
as String,institution: null == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String,institutionLocal: null == institutionLocal ? _self.institutionLocal : institutionLocal // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
