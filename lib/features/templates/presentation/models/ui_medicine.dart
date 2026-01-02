import '../../../home/domain/entities/medicine.dart';

class UiMedicine {
  final Medicine medicine;
  final String? volume;
  final String dosage;
  final String takingTime;
  final String duration;
  final String route;
  final String instruction;

  UiMedicine({
    required this.medicine,
    this.volume,
    required this.dosage,
    required this.takingTime,
    required this.duration,
    required this.route,
    required this.instruction,
  });
}
