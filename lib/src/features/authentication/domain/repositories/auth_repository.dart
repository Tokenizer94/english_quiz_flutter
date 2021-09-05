import 'package:english_quiz_flutter/src/features/authentication/core/params/auth_request_params.dart';
import 'package:english_quiz_flutter/src/core/resources/data_state.dart';
import 'package:english_quiz_flutter/src/features/authentication/core/params/login_request_params.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/auth.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/user_info.dart';

abstract class AuthRepository{
  //? API methods
  Future<DataState<Auth>> requestSendAuthSMS(AuthRequestParams params);
  Future<DataState<UserInfo>> requestLogin(LoginRequestParams params);
}