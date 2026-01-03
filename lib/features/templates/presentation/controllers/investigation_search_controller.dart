import 'package:babosthapotro/features/home/data/repositories/home_repository.dart';
import 'package:babosthapotro/features/home/domain/entities/investigation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'investigation_search_controller.g.dart';

@riverpod
class InvestigationSearchController extends _$InvestigationSearchController {
  @override
  FutureOr<List<Investigation>> build() {
    return [];
  }

  Future<void> search(String query) async {
    if (query.length < 2) {
      state = const AsyncValue.data([]);
      return;
    }

    state = const AsyncValue.loading();
    state = const AsyncValue.loading();
    final newState = await AsyncValue.guard(() async {
      return ref.read(homeRepositoryProvider).getInvestigations(search: query);
    });

    if (ref.mounted) {
      state = newState;
    }
  }

  void clear() {
    state = const AsyncValue.data([]);
  }
}
