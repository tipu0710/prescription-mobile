import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/paginated_response.dart';
import '../../data/models/prescription_template.dart';
import '../../data/models/sponsored.dart';
import '../../data/repositories/home_repository.dart';

part 'home_provider.g.dart';

@riverpod
class TemplateList extends _$TemplateList {
  @override
  Future<PaginatedResponse<PrescriptionTemplate>> build({
    String? search,
    int? page,
  }) {
    return ref
        .watch(homeRepositoryProvider)
        .getTemplates(search: search, page: page);
  }
}

@riverpod
Future<Sponsored> sponsored(Ref ref) {
  return ref.watch(homeRepositoryProvider).getSponsored();
}
