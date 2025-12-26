import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/dio_provider.dart';
import '../../features/auth/data/models/login_request.dart';
import '../../features/auth/data/models/login_response.dart';
import '../../features/auth/data/models/signup_request.dart';
import '../../features/auth/data/models/verification_request.dart';
import '../../features/auth/data/models/resend_otp_request.dart';
import '../../features/auth/data/models/password_reset_request_model.dart';
import '../../features/auth/data/models/password_reset_confirm_request_model.dart';
import '../../features/auth/data/models/user_profile.dart'; // import profile
import '../../features/profile/data/models/degree.dart';
import '../../features/profile/data/models/chamber.dart';
import '../../core/models/paginated_response.dart';
import '../../features/home/data/models/sponsored.dart';
import '../../features/home/data/models/prescription_template.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Auth
  @POST('/api/auth/login/')
  Future<LoginResponse> login(@Body() LoginRequest body);

  @POST('/api/auth/register/')
  Future<void> signup(@Body() SignupRequest body);

  @POST('/api/auth/verify/')
  Future<void> verify(@Body() VerificationRequest body);

  @POST('/api/auth/resend-otp/')
  Future<void> resendOtp(@Body() ResendOtpRequest body);

  @POST('/api/auth/password-reset/request/')
  Future<void> requestPasswordReset(@Body() PasswordResetRequestModel body);

  @POST('/api/auth/password-reset/confirm/')
  Future<void> confirmPasswordReset(
    @Body() PasswordResetConfirmRequestModel body,
  );

  @GET('/api/user/profile/')
  Future<UserProfile> getProfile();

  @GET('/api/user/degrees/')
  Future<List<Degree>> getDegrees();

  @GET('/api/user/chambers/')
  Future<List<Chamber>> getChambers();

  // Home
  @GET('/api/prescriptions/templates/')
  Future<PaginatedResponse<PrescriptionTemplate>> getTemplates(
    @Query('search') String? search,
    @Query('page') int? page,
  );

  @GET('/api/sponsored/serve/')
  Future<Sponsored> getSponsored();

  @DELETE('/api/prescriptions/templates/{id}/')
  Future<void> deleteTemplate(@Path('id') int id);
}

@riverpod
ApiClient apiClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio);
}
