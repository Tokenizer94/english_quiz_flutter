import 'dart:io';

import 'package:dio/dio.dart';
import 'package:english_quiz_flutter/src/features/authentication/core/params/auth_request_params.dart';
import 'package:english_quiz_flutter/src/core/resources/data_state.dart';
import 'package:english_quiz_flutter/src/features/authentication/core/params/login_request_params.dart';
import 'package:english_quiz_flutter/src/features/authentication/data/datasources/remote/auth_api_service.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/auth.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/user_info.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  const AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<Auth>> requestSendAuthSMS(AuthRequestParams params) async {
    try {
      final httpResponse = await _authApiService.requestSendAuthSMS(
        phoneNumber: params.phoneNumber,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.auth);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserInfo>> requestLogin(LoginRequestParams params) async {
    try {
      final httpResponse = await _authApiService.requestLogin(
        fullname: params.fullname,
        phoneNumber: params.phoneNumber,
        verifyCode: params.verifyCode,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.userInfo);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
