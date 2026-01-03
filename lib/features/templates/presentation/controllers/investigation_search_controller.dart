import 'dart:async';
import 'package:babosthapotro/features/home/data/repositories/home_repository.dart';
import 'package:babosthapotro/features/home/domain/entities/investigation.dart';
import 'package:babosthapotro/core/utils/debouncer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'investigation_search_controller.g.dart';

@riverpod
class InvestigationSearchController extends _$InvestigationSearchController {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  FutureOr<List<Investigation>> build() {
    ref.onDispose(() {
      _debouncer.dispose();
    });
    return [];
  }

  Future<void> search(String query) async {
    if (query.length < 2) {
      state = const AsyncValue.data([]);
      return;
    }

    final completer = Completer<void>();

    _debouncer.run(() async {
      state = const AsyncValue.loading();
      final newState = await AsyncValue.guard(() async {
        final results = await ref
            .read(homeRepositoryProvider)
            .getInvestigations(search: query);

        if (results.isEmpty && query.isNotEmpty) {
          return [
            Investigation(id: -1, name: query),
          ];
        }

        return results;
      });

      if (ref.mounted) {
        state = newState;
      }
      completer.complete();
    });

    return completer.future;
  }

  void clear() {
    state = const AsyncValue.data([]);
  }
}
