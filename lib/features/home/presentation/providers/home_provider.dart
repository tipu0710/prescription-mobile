import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/sponsored.dart';
import '../../data/repositories/home_repository.dart';

part 'home_provider.g.dart';

@riverpod
Future<Sponsored> sponsored(Ref ref) {
  return ref.watch(homeRepositoryProvider).getSponsored();
}
