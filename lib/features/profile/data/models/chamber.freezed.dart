// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chamber.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chamber {

 int get id;@JsonKey(name: 'chamber_name') String get chamberName; String get address; Contact get contact;@JsonKey(name: 'visiting_hours') List<VisitingHour> get visitingHours;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of Chamber
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChamberCopyWith<Chamber> get copyWith => _$ChamberCopyWithImpl<Chamber>(this as Chamber, _$identity);

  /// Serializes this Chamber to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chamber&&(identical(other.id, id) || other.id == id)&&(identical(other.chamberName, chamberName) || other.chamberName == chamberName)&&(identical(other.address, address) || other.address == address)&&(identical(other.contact, contact) || other.contact == contact)&&const DeepCollectionEquality().equals(other.visitingHours, visitingHours)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chamberName,address,contact,const DeepCollectionEquality().hash(visitingHours),isActive);

@override
String toString() {
  return 'Chamber(id: $id, chamberName: $chamberName, address: $address, contact: $contact, visitingHours: $visitingHours, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ChamberCopyWith<$Res>  {
  factory $ChamberCopyWith(Chamber value, $Res Function(Chamber) _then) = _$ChamberCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'chamber_name') String chamberName, String address, Contact contact,@JsonKey(name: 'visiting_hours') List<VisitingHour> visitingHours,@JsonKey(name: 'is_active') bool isActive
});


$ContactCopyWith<$Res> get contact;

}
/// @nodoc
class _$ChamberCopyWithImpl<$Res>
    implements $ChamberCopyWith<$Res> {
  _$ChamberCopyWithImpl(this._self, this._then);

  final Chamber _self;
  final $Res Function(Chamber) _then;

/// Create a copy of Chamber
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chamberName = null,Object? address = null,Object? contact = null,Object? visitingHours = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,chamberName: null == chamberName ? _self.chamberName : chamberName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as Contact,visitingHours: null == visitingHours ? _self.visitingHours : visitingHours // ignore: cast_nullable_to_non_nullable
as List<VisitingHour>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Chamber
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactCopyWith<$Res> get contact {
  
  return $ContactCopyWith<$Res>(_self.contact, (value) {
    return _then(_self.copyWith(contact: value));
  });
}
}


/// Adds pattern-matching-related methods to [Chamber].
extension ChamberPatterns on Chamber {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chamber value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chamber() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chamber value)  $default,){
final _that = this;
switch (_that) {
case _Chamber():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chamber value)?  $default,){
final _that = this;
switch (_that) {
case _Chamber() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'chamber_name')  String chamberName,  String address,  Contact contact, @JsonKey(name: 'visiting_hours')  List<VisitingHour> visitingHours, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chamber() when $default != null:
return $default(_that.id,_that.chamberName,_that.address,_that.contact,_that.visitingHours,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'chamber_name')  String chamberName,  String address,  Contact contact, @JsonKey(name: 'visiting_hours')  List<VisitingHour> visitingHours, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _Chamber():
return $default(_that.id,_that.chamberName,_that.address,_that.contact,_that.visitingHours,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'chamber_name')  String chamberName,  String address,  Contact contact, @JsonKey(name: 'visiting_hours')  List<VisitingHour> visitingHours, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _Chamber() when $default != null:
return $default(_that.id,_that.chamberName,_that.address,_that.contact,_that.visitingHours,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chamber implements Chamber {
  const _Chamber({required this.id, @JsonKey(name: 'chamber_name') required this.chamberName, required this.address, required this.contact, @JsonKey(name: 'visiting_hours') required final  List<VisitingHour> visitingHours, @JsonKey(name: 'is_active') required this.isActive}): _visitingHours = visitingHours;
  factory _Chamber.fromJson(Map<String, dynamic> json) => _$ChamberFromJson(json);

@override final  int id;
@override@JsonKey(name: 'chamber_name') final  String chamberName;
@override final  String address;
@override final  Contact contact;
 final  List<VisitingHour> _visitingHours;
@override@JsonKey(name: 'visiting_hours') List<VisitingHour> get visitingHours {
  if (_visitingHours is EqualUnmodifiableListView) return _visitingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visitingHours);
}

@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of Chamber
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChamberCopyWith<_Chamber> get copyWith => __$ChamberCopyWithImpl<_Chamber>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChamberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chamber&&(identical(other.id, id) || other.id == id)&&(identical(other.chamberName, chamberName) || other.chamberName == chamberName)&&(identical(other.address, address) || other.address == address)&&(identical(other.contact, contact) || other.contact == contact)&&const DeepCollectionEquality().equals(other._visitingHours, _visitingHours)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chamberName,address,contact,const DeepCollectionEquality().hash(_visitingHours),isActive);

@override
String toString() {
  return 'Chamber(id: $id, chamberName: $chamberName, address: $address, contact: $contact, visitingHours: $visitingHours, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ChamberCopyWith<$Res> implements $ChamberCopyWith<$Res> {
  factory _$ChamberCopyWith(_Chamber value, $Res Function(_Chamber) _then) = __$ChamberCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'chamber_name') String chamberName, String address, Contact contact,@JsonKey(name: 'visiting_hours') List<VisitingHour> visitingHours,@JsonKey(name: 'is_active') bool isActive
});


@override $ContactCopyWith<$Res> get contact;

}
/// @nodoc
class __$ChamberCopyWithImpl<$Res>
    implements _$ChamberCopyWith<$Res> {
  __$ChamberCopyWithImpl(this._self, this._then);

  final _Chamber _self;
  final $Res Function(_Chamber) _then;

/// Create a copy of Chamber
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chamberName = null,Object? address = null,Object? contact = null,Object? visitingHours = null,Object? isActive = null,}) {
  return _then(_Chamber(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,chamberName: null == chamberName ? _self.chamberName : chamberName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as Contact,visitingHours: null == visitingHours ? _self._visitingHours : visitingHours // ignore: cast_nullable_to_non_nullable
as List<VisitingHour>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Chamber
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactCopyWith<$Res> get contact {
  
  return $ContactCopyWith<$Res>(_self.contact, (value) {
    return _then(_self.copyWith(contact: value));
  });
}
}


/// @nodoc
mixin _$Contact {

 String get phone; String get email;
/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactCopyWith<Contact> get copyWith => _$ContactCopyWithImpl<Contact>(this as Contact, _$identity);

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contact&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,email);

@override
String toString() {
  return 'Contact(phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class $ContactCopyWith<$Res>  {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) _then) = _$ContactCopyWithImpl;
@useResult
$Res call({
 String phone, String email
});




}
/// @nodoc
class _$ContactCopyWithImpl<$Res>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._self, this._then);

  final Contact _self;
  final $Res Function(Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? email = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Contact].
extension ContactPatterns on Contact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Contact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Contact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Contact value)  $default,){
final _that = this;
switch (_that) {
case _Contact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Contact value)?  $default,){
final _that = this;
switch (_that) {
case _Contact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Contact() when $default != null:
return $default(_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String email)  $default,) {final _that = this;
switch (_that) {
case _Contact():
return $default(_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String email)?  $default,) {final _that = this;
switch (_that) {
case _Contact() when $default != null:
return $default(_that.phone,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Contact implements Contact {
  const _Contact({required this.phone, required this.email});
  factory _Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

@override final  String phone;
@override final  String email;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactCopyWith<_Contact> get copyWith => __$ContactCopyWithImpl<_Contact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contact&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,email);

@override
String toString() {
  return 'Contact(phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) _then) = __$ContactCopyWithImpl;
@override @useResult
$Res call({
 String phone, String email
});




}
/// @nodoc
class __$ContactCopyWithImpl<$Res>
    implements _$ContactCopyWith<$Res> {
  __$ContactCopyWithImpl(this._self, this._then);

  final _Contact _self;
  final $Res Function(_Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? email = null,}) {
  return _then(_Contact(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VisitingHour {

 String get day;@JsonKey(name: 'time_slots') List<TimeSlot> get timeSlots;
/// Create a copy of VisitingHour
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitingHourCopyWith<VisitingHour> get copyWith => _$VisitingHourCopyWithImpl<VisitingHour>(this as VisitingHour, _$identity);

  /// Serializes this VisitingHour to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VisitingHour&&(identical(other.day, day) || other.day == day)&&const DeepCollectionEquality().equals(other.timeSlots, timeSlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,const DeepCollectionEquality().hash(timeSlots));

@override
String toString() {
  return 'VisitingHour(day: $day, timeSlots: $timeSlots)';
}


}

/// @nodoc
abstract mixin class $VisitingHourCopyWith<$Res>  {
  factory $VisitingHourCopyWith(VisitingHour value, $Res Function(VisitingHour) _then) = _$VisitingHourCopyWithImpl;
@useResult
$Res call({
 String day,@JsonKey(name: 'time_slots') List<TimeSlot> timeSlots
});




}
/// @nodoc
class _$VisitingHourCopyWithImpl<$Res>
    implements $VisitingHourCopyWith<$Res> {
  _$VisitingHourCopyWithImpl(this._self, this._then);

  final VisitingHour _self;
  final $Res Function(VisitingHour) _then;

/// Create a copy of VisitingHour
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? timeSlots = null,}) {
  return _then(_self.copyWith(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,timeSlots: null == timeSlots ? _self.timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [VisitingHour].
extension VisitingHourPatterns on VisitingHour {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VisitingHour value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VisitingHour() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VisitingHour value)  $default,){
final _that = this;
switch (_that) {
case _VisitingHour():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VisitingHour value)?  $default,){
final _that = this;
switch (_that) {
case _VisitingHour() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String day, @JsonKey(name: 'time_slots')  List<TimeSlot> timeSlots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VisitingHour() when $default != null:
return $default(_that.day,_that.timeSlots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String day, @JsonKey(name: 'time_slots')  List<TimeSlot> timeSlots)  $default,) {final _that = this;
switch (_that) {
case _VisitingHour():
return $default(_that.day,_that.timeSlots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String day, @JsonKey(name: 'time_slots')  List<TimeSlot> timeSlots)?  $default,) {final _that = this;
switch (_that) {
case _VisitingHour() when $default != null:
return $default(_that.day,_that.timeSlots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VisitingHour implements VisitingHour {
  const _VisitingHour({required this.day, @JsonKey(name: 'time_slots') required final  List<TimeSlot> timeSlots}): _timeSlots = timeSlots;
  factory _VisitingHour.fromJson(Map<String, dynamic> json) => _$VisitingHourFromJson(json);

@override final  String day;
 final  List<TimeSlot> _timeSlots;
@override@JsonKey(name: 'time_slots') List<TimeSlot> get timeSlots {
  if (_timeSlots is EqualUnmodifiableListView) return _timeSlots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeSlots);
}


/// Create a copy of VisitingHour
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisitingHourCopyWith<_VisitingHour> get copyWith => __$VisitingHourCopyWithImpl<_VisitingHour>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VisitingHourToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisitingHour&&(identical(other.day, day) || other.day == day)&&const DeepCollectionEquality().equals(other._timeSlots, _timeSlots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,const DeepCollectionEquality().hash(_timeSlots));

@override
String toString() {
  return 'VisitingHour(day: $day, timeSlots: $timeSlots)';
}


}

/// @nodoc
abstract mixin class _$VisitingHourCopyWith<$Res> implements $VisitingHourCopyWith<$Res> {
  factory _$VisitingHourCopyWith(_VisitingHour value, $Res Function(_VisitingHour) _then) = __$VisitingHourCopyWithImpl;
@override @useResult
$Res call({
 String day,@JsonKey(name: 'time_slots') List<TimeSlot> timeSlots
});




}
/// @nodoc
class __$VisitingHourCopyWithImpl<$Res>
    implements _$VisitingHourCopyWith<$Res> {
  __$VisitingHourCopyWithImpl(this._self, this._then);

  final _VisitingHour _self;
  final $Res Function(_VisitingHour) _then;

/// Create a copy of VisitingHour
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? timeSlots = null,}) {
  return _then(_VisitingHour(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,timeSlots: null == timeSlots ? _self._timeSlots : timeSlots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>,
  ));
}


}


/// @nodoc
mixin _$TimeSlot {

 String get start; String get end;
/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotCopyWith<TimeSlot> get copyWith => _$TimeSlotCopyWithImpl<TimeSlot>(this as TimeSlot, _$identity);

  /// Serializes this TimeSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlot&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'TimeSlot(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $TimeSlotCopyWith<$Res>  {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) _then) = _$TimeSlotCopyWithImpl;
@useResult
$Res call({
 String start, String end
});




}
/// @nodoc
class _$TimeSlotCopyWithImpl<$Res>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._self, this._then);

  final TimeSlot _self;
  final $Res Function(TimeSlot) _then;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeSlot].
extension TimeSlotPatterns on TimeSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeSlot value)  $default,){
final _that = this;
switch (_that) {
case _TimeSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeSlot value)?  $default,){
final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String start,  String end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String start,  String end)  $default,) {final _that = this;
switch (_that) {
case _TimeSlot():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String start,  String end)?  $default,) {final _that = this;
switch (_that) {
case _TimeSlot() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeSlot implements TimeSlot {
  const _TimeSlot({required this.start, required this.end});
  factory _TimeSlot.fromJson(Map<String, dynamic> json) => _$TimeSlotFromJson(json);

@override final  String start;
@override final  String end;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeSlotCopyWith<_TimeSlot> get copyWith => __$TimeSlotCopyWithImpl<_TimeSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeSlot&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'TimeSlot(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$TimeSlotCopyWith<$Res> implements $TimeSlotCopyWith<$Res> {
  factory _$TimeSlotCopyWith(_TimeSlot value, $Res Function(_TimeSlot) _then) = __$TimeSlotCopyWithImpl;
@override @useResult
$Res call({
 String start, String end
});




}
/// @nodoc
class __$TimeSlotCopyWithImpl<$Res>
    implements _$TimeSlotCopyWith<$Res> {
  __$TimeSlotCopyWithImpl(this._self, this._then);

  final _TimeSlot _self;
  final $Res Function(_TimeSlot) _then;

/// Create a copy of TimeSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_TimeSlot(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
