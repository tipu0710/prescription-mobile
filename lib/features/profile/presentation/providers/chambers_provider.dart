import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/api/api_client.dart';
import '../../data/models/chamber.dart';

part 'chambers_provider.g.dart';

@riverpod
class Chambers extends _$Chambers {
  @override
  Future<List<Chamber>> build() {
    return ref.watch(apiClientProvider).getChambers();
  }
}
