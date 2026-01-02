// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chamber.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chamber _$ChamberFromJson(Map<String, dynamic> json) => _Chamber(
  id: (json['id'] as num).toInt(),
  chamberName: json['chamber_name'] as String,
  address: json['address'] as String,
  contact: Contact.fromJson(json['contact'] as Map<String, dynamic>),
  visitingHours: (json['visiting_hours'] as List<dynamic>)
      .map((e) => VisitingHour.fromJson(e as Map<String, dynamic>))
      .toList(),
  isActive: json['is_active'] as bool,
);

Map<String, dynamic> _$ChamberToJson(_Chamber instance) => <String, dynamic>{
  'id': instance.id,
  'chamber_name': instance.chamberName,
  'address': instance.address,
  'contact': instance.contact,
  'visiting_hours': instance.visitingHours,
  'is_active': instance.isActive,
};

_Contact _$ContactFromJson(Map<String, dynamic> json) =>
    _Contact(phone: json['phone'] as String, email: json['email'] as String);

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
  'phone': instance.phone,
  'email': instance.email,
};

_VisitingHour _$VisitingHourFromJson(Map<String, dynamic> json) =>
    _VisitingHour(
      day: json['day'] as String,
      timeSlots: (json['time_slots'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VisitingHourToJson(_VisitingHour instance) =>
    <String, dynamic>{'day': instance.day, 'time_slots': instance.timeSlots};

_TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) =>
    _TimeSlot(start: json['start'] as String, end: json['end'] as String);

Map<String, dynamic> _$TimeSlotToJson(_TimeSlot instance) => <String, dynamic>{
  'start': instance.start,
  'end': instance.end,
};
