import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/paginated_response.dart';
import '../../domain/entities/prescription_template.dart';
import '../../data/repositories/home_repository.dart';

part 'template_provider.g.dart';

@riverpod
class TemplateListNotifier extends _$TemplateListNotifier {
  String? _currentSearch;

  @override
  Future<PaginatedResponse<PrescriptionTemplate>> build() async {
    return _fetchTemplates(page: 1, search: _currentSearch);
  }

  Future<PaginatedResponse<PrescriptionTemplate>> _fetchTemplates({
    required int page,
    String? search,
  }) async {
    return ref
        .read(homeRepositoryProvider)
        .getTemplates(search: search, page: page);
  }

  Future<void> loadMore() async {
    final currentState = state.value;
    if (currentState == null || state.isLoading || state.hasError) return;

    if (currentState.next == null) return;

    final currentCount = currentState.results.length;
    if (currentCount >= currentState.count) return;

    final nextPage = (currentCount ~/ 10) + 1;

    try {
      final response = await _fetchTemplates(
        page: nextPage,
        search: _currentSearch,
      );

      state = AsyncValue.data(
        PaginatedResponse(
          count: response.count,
          next: response.next,
          previous: response.previous,
          results: [...currentState.results, ...response.results],
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async => performSearch(_currentSearch ?? '');

  Future<void> performSearch(String query) async {
    _currentSearch = query;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _fetchTemplates(page: 1, search: query),
    );
  }
}
