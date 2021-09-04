import 'package:english_quiz_flutter/src/core/params/auth_request.dart';
import 'package:english_quiz_flutter/src/core/resources/data_state.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/auth.dart';

abstract class AuthRepository{
  //? API methods
  Future<DataState<Auth>> requestSendSMS(AuthRequestParams params);
}