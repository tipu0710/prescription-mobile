import 'package:freezed_annotation/freezed_annotation.dart';

part 'chamber.freezed.dart';
part 'chamber.g.dart';

@freezed
abstract class Chamber with _$Chamber {
  const factory Chamber({
    required int id,
    @JsonKey(name: 'chamber_name') required String chamberName,
    required String address,
    required Contact contact,
    @JsonKey(name: 'visiting_hours') required List<VisitingHour> visitingHours,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _Chamber;

  factory Chamber.fromJson(Map<String, dynamic> json) =>
      _$ChamberFromJson(json);
}

@freezed
abstract class Contact with _$Contact {
  const factory Contact({required String phone, required String email}) =
      _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

@freezed
abstract class VisitingHour with _$VisitingHour {
  const factory VisitingHour({
    required String day,
    @JsonKey(name: 'time_slots') required List<TimeSlot> timeSlots,
  }) = _VisitingHour;

  factory VisitingHour.fromJson(Map<String, dynamic> json) =>
      _$VisitingHourFromJson(json);
}

@freezed
abstract class TimeSlot with _$TimeSlot {
  const factory TimeSlot({required String start, required String end}) =
      _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}
