import '../../../../core/models/paginated_response.dart';
import '../entities/create_template_request.dart';
import '../entities/investigation.dart';
import '../entities/medicine.dart';
import '../entities/prescription_template.dart';
import '../entities/sponsored.dart';

abstract class HomeRepository {
  Future<PaginatedResponse<PrescriptionTemplate>> getTemplates({
    String? search,
    int? page,
  });

  Future<Sponsored> getSponsored();

  Future<void> deleteTemplate(int id);

  Future<void> createTemplate(CreateTemplateRequest request);

  Future<List<Medicine>> getMedicines({String? search, int? page});

  Future<List<Investigation>> getInvestigations({String? search, int? page});
}
