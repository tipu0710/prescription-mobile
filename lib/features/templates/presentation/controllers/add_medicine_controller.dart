import 'package:babosthapotro/features/home/data/repositories/home_repository.dart';
import 'package:babosthapotro/features/home/domain/entities/medicine.dart';
import 'package:babosthapotro/features/home/domain/entities/missing_medicine.dart';
import 'package:babosthapotro/features/templates/data/datasources/dosage_data_source.dart';
import 'package:babosthapotro/features/templates/presentation/models/ui_medicine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_medicine_controller.g.dart';

class AddMedicineState {
  final Medicine? selectedMedicine;
  final String searchQuery;
  final String dosageForm;
  final String strength;
  final bool isManualEntry;
  final bool hasSearchResults;

  // Field values
  final String dosage;
  final String takingTime;
  final String duration;
  final String route;
  final String instruction;
  final String volume;

  // Suggestions
  final List<String> sourceDosages;
  final List<String> sourceTakingTimes;
  final List<String> sourceRoutes;
  final List<String> sourceInstructions;
  final List<String> sourceDurations;

  final List<String> suggestedRoutes;
  final List<String> suggestedDurations;

  const AddMedicineState({
    this.selectedMedicine,
    this.searchQuery = '',
    this.dosageForm = '',
    this.strength = '',
    this.isManualEntry = true,
    this.hasSearchResults = false,
    this.dosage = '',
    this.takingTime = '',
    this.duration = '',
    this.route = '',
    this.instruction = '',
    this.volume = '',
    this.sourceDosages = const [],
    this.sourceTakingTimes = const [],
    this.sourceRoutes = const [],
    this.sourceInstructions = const [],
    this.sourceDurations = const [],
    this.suggestedRoutes = const [],
    this.suggestedDurations = const [],
  });

  AddMedicineState copyWith({
    Medicine? selectedMedicine,
    String? searchQuery,
    String? dosageForm,
    String? strength,
    bool? isManualEntry,
    bool? hasSearchResults,
    String? dosage,
    String? takingTime,
    String? duration,
    String? route,
    String? instruction,
    String? volume,
    List<String>? sourceDosages,
    List<String>? sourceTakingTimes,
    List<String>? sourceRoutes,
    List<String>? sourceInstructions,
    List<String>? sourceDurations,
    List<String>? suggestedRoutes,
    List<String>? suggestedDurations,
  }) {
    return AddMedicineState(
      selectedMedicine: selectedMedicine ?? this.selectedMedicine,
      searchQuery: searchQuery ?? this.searchQuery,
      dosageForm: dosageForm ?? this.dosageForm,
      strength: strength ?? this.strength,
      isManualEntry: isManualEntry ?? this.isManualEntry,
      hasSearchResults: hasSearchResults ?? this.hasSearchResults,
      dosage: dosage ?? this.dosage,
      takingTime: takingTime ?? this.takingTime,
      duration: duration ?? this.duration,
      route: route ?? this.route,
      instruction: instruction ?? this.instruction,
      volume: volume ?? this.volume,
      sourceDosages: sourceDosages ?? this.sourceDosages,
      sourceTakingTimes: sourceTakingTimes ?? this.sourceTakingTimes,
      sourceRoutes: sourceRoutes ?? this.sourceRoutes,
      sourceInstructions: sourceInstructions ?? this.sourceInstructions,
      sourceDurations: sourceDurations ?? this.sourceDurations,
      suggestedRoutes: suggestedRoutes ?? this.suggestedRoutes,
      suggestedDurations: suggestedDurations ?? this.suggestedDurations,
    );
  }
}

@riverpod
class AddMedicineController extends _$AddMedicineController {
  static const _englishDigits = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  static const _banglaDigits = [
    '০',
    '১',
    '২',
    '৩',
    '৪',
    '৫',
    '৬',
    '৭',
    '৮',
    '৯',
  ];

  final List<String> _allRoutes = [
    'Oral',
    'IV',
    'IM',
    'SC',
    'Topical',
    'Ophthalmic',
    'Nasal',
    'Otic',
    'Rectal',
    'Vaginal',
    'Inhalation',
  ];

  List<String> get allDosageForms => dosageFormMap.keys.toList()..sort();

  @override
  AddMedicineState build() {
    return const AddMedicineState();
  }

  void initialize(UiMedicine? initialMedicine) {
    if (initialMedicine != null) {
      final m = initialMedicine.medicine;
      state = state.copyWith(
        selectedMedicine: m,
        searchQuery: m.brandName,
        dosageForm: m.dosageForm,
        strength: m.strength,
        dosage: initialMedicine.dosage,
        takingTime: initialMedicine.takingTime,
        duration: initialMedicine.duration,
        route: initialMedicine.route,
        instruction: initialMedicine.instruction,
        volume: initialMedicine.volume ?? '',
        isManualEntry: m.id == 0,
      );
      _updateSuggestions(m);
    } else {
      _updateSuggestions(null);
    }
  }

  void reset() {
    state = const AddMedicineState();
    _updateSuggestions(null);
  }

  void onSearchQueryChanged(String query) {
    state = state.copyWith(searchQuery: query);

    if (state.selectedMedicine != null &&
        query != state.selectedMedicine!.brandName) {
      state = state.copyWith(
        selectedMedicine: null, // Clear selection if typing changes
        isManualEntry: true,
        dosageForm: '',
        strength: '',
      );
    }
  }

  void setHasSearchResults(bool hasResults) {
    if (state.hasSearchResults != hasResults) {
      state = state.copyWith(hasSearchResults: hasResults);
    }
  }

  void onMedicineSelected(Medicine medicine) {
    state = state.copyWith(
      selectedMedicine: medicine,
      searchQuery: medicine.brandName,
      isManualEntry: false,
      dosageForm: medicine.dosageForm,
      strength: medicine.strength,
      volume: '',
    );
    _updateSuggestions(medicine, clearValues: true);
  }

  void onFormChanged(String value) {
    state = state.copyWith(dosageForm: value);
    _updateSuggestions(null);
  }

  void onStrengthChanged(String value) {
    state = state.copyWith(strength: value);
  }

  void onDosageChanged(String value) => state = state.copyWith(dosage: value);
  void onTakingTimeChanged(String value) =>
      state = state.copyWith(takingTime: value);
  void onInstructionChanged(String value) =>
      state = state.copyWith(instruction: value);
  void onVolumeChanged(String value) => state = state.copyWith(volume: value);

  void onDurationChanged(String value) {
    state = state.copyWith(duration: value);
    _filterDurations();
  }

  void onRouteChanged(String value) {
    state = state.copyWith(route: value);
    _filterRoutes();
  }

  void _updateSuggestions(Medicine? medicine, {bool clearValues = false}) {
    final form = medicine?.dosageForm ?? state.dosageForm;
    final generic = medicine?.genericName ?? '';

    final suggestions = getDosageSuggestions(
      dosageForm: form,
      genericName: generic,
      lang: 'bn',
    );

    final durations = getDurationSuggestions('bn');

    var nextState = state.copyWith(
      sourceDosages: suggestions.dosages,
      sourceTakingTimes: suggestions.takingTimes,
      sourceRoutes: suggestions.routes,
      sourceInstructions: suggestions.notes,
      sourceDurations: durations,
      suggestedRoutes: suggestions.routes,
      suggestedDurations: durations,
    );

    if (clearValues) {
      nextState = nextState.copyWith(
        dosage: '',
        takingTime: '',
        duration: '',
        instruction: '',
        volume: '',
        route: '',
      );
    }

    String currentRoute = clearValues ? '' : nextState.route;
    if (suggestions.routes.length == 1) {
      currentRoute = suggestions.routes.first;
    } else if (currentRoute.isEmpty && isOralDosageForm(form)) {
      currentRoute = 'Oral';
    }

    nextState = nextState.copyWith(route: currentRoute);

    state = nextState;
    _filterRoutes();
    _filterDurations();
  }

  void _filterRoutes() {
    final query = state.route;
    final allRelevant = {...state.sourceRoutes, ..._allRoutes}.toList();
    final sorted = _sortSuggestions(allRelevant, query);
    state = state.copyWith(suggestedRoutes: sorted);
  }

  void _filterDurations() {
    final query = state.duration;
    if (state.sourceDurations.contains(query)) {
      state = state.copyWith(suggestedDurations: state.sourceDurations);
      return;
    }

    final sorted = _sortSuggestions(state.sourceDurations, query);

    if (query.isNotEmpty) {
      final qLower = query.toLowerCase();
      final qDigitsOnly = qLower.replaceAll(RegExp(r'[^0-9০-৯]'), '');
      final qBangla = _toBangla(qLower);
      final qBanglaDigitsOnly = qDigitsOnly.isNotEmpty
          ? _toBangla(qDigitsOnly)
          : '';

      final filtered = sorted.where((s) {
        return _matchScore(s, qLower, qBangla, qDigitsOnly, qBanglaDigitsOnly) >
            0;
      }).toList();
      state = state.copyWith(suggestedDurations: filtered);
    } else {
      state = state.copyWith(suggestedDurations: sorted);
    }
  }

  List<String> filterDosageForms(String query) {
    if (query.isEmpty) return allDosageForms;

    final lowerQuery = query.toLowerCase();
    final filtered = allDosageForms
        .where((option) => option.toLowerCase().contains(lowerQuery))
        .toList();

    filtered.sort((a, b) {
      final aLower = a.toLowerCase();
      final bLower = b.toLowerCase();

      // 1. Exact match
      if (aLower == lowerQuery && bLower != lowerQuery) return -1;
      if (bLower == lowerQuery && aLower != lowerQuery) return 1;

      // 2. Starts with
      final aStarts = aLower.startsWith(lowerQuery);
      final bStarts = bLower.startsWith(lowerQuery);
      if (aStarts && !bStarts) return -1;
      if (!aStarts && bStarts) return 1;

      // 3. Alphabetical
      return a.compareTo(b);
    });

    return filtered;
  }

  // Helper methods
  String _toBangla(String input) {
    var output = input;
    for (int i = 0; i < 10; i++) {
      output = output.replaceAll(_englishDigits[i], _banglaDigits[i]);
    }
    return output;
  }

  int _matchScore(
    String source,
    String query,
    String queryBangla,
    String queryDigitsOnly,
    String queryBanglaDigitsOnly,
  ) {
    final sLower = source.toLowerCase();
    // 1. Exact match
    if (sLower == query || sLower == queryBangla) return 3;

    // 2. Smart Digit Exact match
    if (queryDigitsOnly.isNotEmpty) {
      final sDigitsOnly = sLower.replaceAll(RegExp(r'[^0-9০-৯]'), '');
      if (sDigitsOnly == queryDigitsOnly ||
          sDigitsOnly == queryBanglaDigitsOnly)
        return 3;
      if (sDigitsOnly.contains(queryDigitsOnly) ||
          sDigitsOnly.contains(queryBanglaDigitsOnly))
        return 2;
    }

    // 3. Contains match
    if (sLower.contains(query) || sLower.contains(queryBangla)) return 2;

    return 0;
  }

  List<String> _sortSuggestions(
    List<String> source,
    String query, {
    bool strict = false,
  }) {
    final qLower = query.toLowerCase();
    final qDigitsOnly = qLower.replaceAll(RegExp(r'[^0-9০-৯]'), '');
    final qBangla = _toBangla(qLower);
    final qBanglaDigitsOnly = qDigitsOnly.isNotEmpty
        ? _toBangla(qDigitsOnly)
        : '';

    List<MapEntry<int, String>> items = source.asMap().entries.toList();

    items.sort((a, b) {
      int scoreA = _matchScore(
        a.value,
        qLower,
        qBangla,
        qDigitsOnly,
        qBanglaDigitsOnly,
      );
      int scoreB = _matchScore(
        b.value,
        qLower,
        qBangla,
        qDigitsOnly,
        qBanglaDigitsOnly,
      );

      if (strict) {
        if (scoreA == 2) scoreA = 0;
        if (scoreB == 2) scoreB = 0;
      }

      if (scoreA != scoreB) {
        return scoreB.compareTo(scoreA); // Descending
      }
      return a.key.compareTo(b.key); // Stable
    });

    return items.map((e) => e.value).toList();
  }

  List<String> getDosageMatches(String query, bool isInfusion) {
    final qLower = query.toLowerCase();
    final qBangla = _toBangla(qLower);
    final qDigitsOnly = qLower.replaceAll(RegExp(r'[^0-9০-৯]'), '');
    final qBanglaDigitsOnly = qDigitsOnly.isNotEmpty
        ? _toBangla(qDigitsOnly)
        : '';

    int getScore(String source) =>
        _matchScore(source, qLower, qBangla, qDigitsOnly, qBanglaDigitsOnly);

    final matches = state.sourceDosages.where((option) {
      if (isInfusion) return true;
      return getScore(option) > 0;
    }).toList();

    matches.sort((a, b) {
      final scoreA = getScore(a);
      final scoreB = getScore(b);
      if (scoreA != scoreB) return scoreB.compareTo(scoreA);
      return a.compareTo(b);
    });

    return matches;
  }

  // Save Action
  Future<UiMedicine> saveMedicine(UiMedicine? initialMedicine) async {
    Medicine medicineToSave;

    if (state.selectedMedicine != null) {
      medicineToSave = state.selectedMedicine!;
    } else {
      medicineToSave = Medicine(
        id: 0,
        brandName: state.searchQuery,
        genericName: '',
        strength: state.strength,
        manufacturer: '',
        dosageForm: state.dosageForm,
      );

      if (initialMedicine == null) {
        ref
            .read(homeRepositoryProvider)
            .createMissingMedicine(
              MissingMedicine(
                brandName: state.searchQuery,
                dosageForm: state.dosageForm,
                strength: state.strength,
              ),
            );
      }
    }

    return UiMedicine(
      medicine: medicineToSave,
      volume: state.volume.isNotEmpty ? state.volume : null,
      dosage: state.dosage,
      takingTime: state.takingTime,
      duration: state.duration,
      route: state.route.isEmpty ? 'Oral' : state.route,
      instruction: state.instruction,
    );
  }
}
