import '../entities/dosage_suggestions.dart';

abstract class TemplatesRepository {
  DosageSuggestions getDosageSuggestions({
    required String dosageForm,
    String? genericName,
    required String lang,
  });

  List<String> getDurationSuggestions(String lang);

  bool isOralDosageForm(String? dosageForm);

  bool isInfusion(String? dosageForm);

  bool isSuppository(String? dosageForm);

  List<String> getInfusionVolumes();
}
