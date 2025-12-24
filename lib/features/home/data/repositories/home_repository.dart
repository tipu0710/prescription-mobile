import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/paginated_response.dart';
import '../../../../data/api/api_client.dart';
import '../models/prescription_template.dart';
import '../models/sponsored.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepository(ref.watch(apiClientProvider));
}

class HomeRepository {
  final ApiClient _apiClient;

  HomeRepository(this._apiClient);

  Future<PaginatedResponse<PrescriptionTemplate>> getTemplates({
    String? search,
    int? page,
  }) async {
    return _apiClient.getTemplates(search, page);
  }

  Future<Sponsored> getSponsored() async {
    return _apiClient.getSponsored();
  }

  Future<void> deleteTemplate(int id) async {
    return _apiClient.deleteTemplate(id);
  }
}
