import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/api/api_client.dart';
import '../../domain/entities/degree.dart';

part 'degrees_provider.g.dart';

@riverpod
class Degrees extends _$Degrees {
  @override
  Future<List<Degree>> build() {
    return ref.watch(apiClientProvider).getDegrees();
  }

  Future<void> addDegree(Degree degree) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(apiClientProvider).createDegree(degree);
      return ref.read(apiClientProvider).getDegrees();
    });
  }

  Future<void> editDegree(Degree degree) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(apiClientProvider).updateDegree(degree.id, degree);
      return ref.read(apiClientProvider).getDegrees();
    });
  }

  Future<void> deleteDegree(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(apiClientProvider).deleteDegree(id);
      return ref.read(apiClientProvider).getDegrees();
    });
  }
}
