import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/paginated_response.dart';
import '../../../../data/api/api_client.dart';
import '../../domain/entities/create_template_request.dart';
import '../../domain/entities/investigation.dart';
import '../../domain/entities/medicine.dart';
import '../../domain/entities/prescription_template.dart';
import '../../domain/entities/sponsored.dart';
import '../../domain/repositories/home_repository.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl(ref.watch(apiClientProvider));
}

class HomeRepositoryImpl implements HomeRepository {
  final ApiClient _apiClient;

  HomeRepositoryImpl(this._apiClient);

  @override
  Future<PaginatedResponse<PrescriptionTemplate>> getTemplates({
    String? search,
    int? page,
  }) async {
    return _apiClient.getTemplates(search, page);
  }

  @override
  Future<Sponsored> getSponsored() async {
    return _apiClient.getSponsored();
  }

  @override
  Future<void> deleteTemplate(int id) async {
    return _apiClient.deleteTemplate(id);
  }

  @override
  Future<void> createTemplate(CreateTemplateRequest request) async {
    return _apiClient.createTemplate(request);
  }

  @override
  Future<List<Medicine>> getMedicines({String? search, int? page}) async {
    return _apiClient.getMedicines(search, page);
  }

  @override
  Future<List<Investigation>> getInvestigations({
    String? search,
    int? page,
  }) async {
    return _apiClient.getInvestigations(search, page);
  }
}
