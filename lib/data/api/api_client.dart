import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/dio_provider.dart';
import '../../features/auth/data/models/login_request.dart';
import '../../features/auth/data/models/login_response.dart';
import '../../features/auth/data/models/refresh_token_response.dart';
import '../../features/auth/data/models/signup_request.dart';
import '../../features/auth/data/models/verification_request.dart';
import '../../features/auth/data/models/resend_otp_request.dart';
import '../../features/auth/data/models/password_reset_request_model.dart';
import '../../features/auth/data/models/password_reset_confirm_request_model.dart';
import '../../features/auth/data/models/refresh_token_request.dart';
import '../../features/auth/data/models/user_profile.dart'; // import profile
import '../../features/profile/domain/entities/degree.dart';
import '../../features/profile/domain/entities/chamber.dart';
import '../../core/models/paginated_response.dart';
import '../../features/home/domain/entities/sponsored.dart';
import '../../features/home/domain/entities/prescription_template.dart';
import '../../features/home/domain/entities/create_template_request.dart';
import '../../features/home/domain/entities/medicine.dart';
import '../../features/home/domain/entities/investigation.dart';
import '../../features/home/domain/entities/missing_investigation.dart';

import '../../features/home/domain/entities/missing_medicine.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Auth
  @POST('/api/v1/auth/login/')
  Future<LoginResponse> login(@Body() LoginRequest body);

  @POST('/api/v1/auth/register/')
  Future<void> signup(@Body() SignupRequest body);

  @POST('/api/v1/auth/verify/')
  Future<void> verify(@Body() VerificationRequest body);

  @POST('/api/v1/auth/resend-otp/')
  Future<void> resendOtp(@Body() ResendOtpRequest body);

  @POST('/api/v1/auth/password-reset/request/')
  Future<void> requestPasswordReset(@Body() PasswordResetRequestModel body);

  @POST('/api/v1/auth/password-reset/confirm/')
  Future<void> confirmPasswordReset(
    @Body() PasswordResetConfirmRequestModel body,
  );

  @POST('/api/v1/auth/token/refresh/')
  Future<RefreshTokenResponse> refreshToken(@Body() RefreshTokenRequest body);

  @GET('/api/v1/user/profile/')
  Future<UserProfile> getProfile();

  @PATCH('/api/v1/user/profile/')
  Future<UserProfile> updateProfile(@Body() FormData data);

  @GET('/api/v1/user/degrees/')
  Future<List<Degree>> getDegrees();

  @POST('/api/v1/user/degrees/')
  Future<Degree> createDegree(@Body() Degree degree);

  @PATCH('/api/v1/user/degrees/{id}/')
  Future<Degree> updateDegree(@Path('id') int id, @Body() Degree degree);

  @DELETE('/api/v1/user/degrees/{id}/')
  Future<void> deleteDegree(@Path('id') int id);

  @GET('/api/v1/user/chambers/')
  Future<List<Chamber>> getChambers();

  @POST('/api/v1/user/chambers/')
  Future<Chamber> createChamber(@Body() Chamber chamber);

  @PATCH('/api/v1/user/chambers/{id}/')
  Future<Chamber> updateChamber(@Path('id') int id, @Body() Chamber chamber);

  @DELETE('/api/v1/user/chambers/{id}/')
  Future<void> deleteChamber(@Path('id') int id);

  // Home
  @GET('/api/v1/prescriptions/templates/')
  Future<PaginatedResponse<PrescriptionTemplate>> getTemplates(
    @Query('search') String? search,
    @Query('page') int? page,
  );

  @GET('/api/v1/sponsored/serve/')
  Future<Sponsored> getSponsored();

  @POST('/api/v1/sponsored/{id}/click/')
  Future<void> trackSponsoredClick(@Path('id') int id);

  @DELETE('/api/v1/prescriptions/templates/{id}/')
  Future<void> deleteTemplate(@Path('id') int id);

  @POST('/api/v1/prescriptions/templates/')
  Future<void> createTemplate(@Body() CreateTemplateRequest body);

  @GET('/api/v1/medicines/search/')
  Future<List<Medicine>> getMedicines(
    @Query('q') String? search,
    @Query('page') int? page,
  );

  @GET('/api/v1/investigations/search/')
  Future<List<Investigation>> getInvestigations(
    @Query('q') String? search,
    @Query('page') int? page,
  );

  @POST('/api/v1/medicines/missing-medicines/')
  Future<void> createMissingMedicine(@Body() MissingMedicine medicine);

  @POST('/api/v1/investigations/missing-investigations/')
  Future<void> createMissingInvestigation(
    @Body() MissingInvestigation investigation,
  );
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio);
}

@Riverpod(keepAlive: true)
ApiClient authApiClient(Ref ref) {
  final dio = ref.watch(tokenDioProvider);
  return ApiClient(dio);
}
