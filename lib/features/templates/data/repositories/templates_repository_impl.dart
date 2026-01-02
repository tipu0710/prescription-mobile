import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/dosage_suggestions.dart';
import '../../domain/repositories/templates_repository.dart';
import '../datasources/dosage_data_source.dart' as source;

part 'templates_repository_impl.g.dart';

@riverpod
TemplatesRepository templatesRepository(Ref ref) {
  return TemplatesRepositoryImpl();
}

class TemplatesRepositoryImpl implements TemplatesRepository {
  @override
  DosageSuggestions getDosageSuggestions({
    required String dosageForm,
    String? genericName,
    required String lang,
  }) {
    return source.getDosageSuggestions(
      dosageForm: dosageForm,
      genericName: genericName,
      lang: lang,
    );
  }

  @override
  List<String> getDurationSuggestions(String lang) {
    return source.getDurationSuggestions(lang);
  }

  @override
  bool isOralDosageForm(String? dosageForm) {
    return source.isOralDosageForm(dosageForm);
  }

  @override
  bool isInfusion(String? dosageForm) {
    return source.isInfusion(dosageForm);
  }

  @override
  bool isSuppository(String? dosageForm) {
    return source.isSuppository(dosageForm);
  }

  @override
  List<String> getInfusionVolumes() {
    return source.infusionVolumes;
  }
}
