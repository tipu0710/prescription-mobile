import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/api/api_client.dart';
import '../../domain/entities/chamber.dart';

part 'chambers_provider.g.dart';

@riverpod
class Chambers extends _$Chambers {
  @override
  Future<List<Chamber>> build() {
    return ref.watch(apiClientProvider).getChambers();
  }

  Future<void> addChamber(Chamber chamber) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(apiClientProvider).createChamber(chamber);
      return ref.read(apiClientProvider).getChambers();
    });
  }

  Future<void> editChamber(Chamber chamber) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(apiClientProvider).updateChamber(chamber.id, chamber);
      return ref.read(apiClientProvider).getChambers();
    });
  }

  Future<void> deleteChamber(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(apiClientProvider).deleteChamber(id);
      return ref.read(apiClientProvider).getChambers();
    });
  }
}
