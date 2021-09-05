import 'package:dio/dio.dart';
import 'package:english_quiz_flutter/src/core/utils/constants.dart';
import 'package:english_quiz_flutter/src/features/authentication/data/models/auth_response_model.dart';
import 'package:english_quiz_flutter/src/features/authentication/data/models/user_info_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

//ToDo: Add full name to mock API and here
//ToDo: Make verifyCode static in mock and test error condition
  @POST('/otp_login')
  Future<HttpResponse<AuthResponseModel>> requestSendAuthSMS({
    @Field('phone_number') required String phoneNumber,
  });

  @POST('/verify_code')
  Future<HttpResponse<UserInfoResponseModel>> getUserInfo({
    @Field('fullname') required String fullname,
    @Field('phone_number') required String phoneNumber,
    @Field('verify_code') required String verifyCode,
  });
}
