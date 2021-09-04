import 'package:english_quiz_flutter/src/core/utils/constants.dart';
import 'package:english_quiz_flutter/src/features/authentication/data/models/auth_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/otp_login')
  Future<HttpResponse<AuthResponseModel>> requestSendSMS({
    @Query('phone_number') String phoneNumber,
  });
}
