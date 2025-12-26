import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/api/api_client.dart';
import '../../data/models/degree.dart';

part 'degrees_provider.g.dart';

@riverpod
class Degrees extends _$Degrees {
  @override
  Future<List<Degree>> build() {
    return ref.watch(apiClientProvider).getDegrees();
  }
}
