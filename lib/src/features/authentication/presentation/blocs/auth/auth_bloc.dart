import 'dart:async';

import 'package:dio/dio.dart';
import 'package:english_quiz_flutter/src/core/bloc/bloc_with_state.dart';
import 'package:english_quiz_flutter/src/features/authentication/core/params/auth_request_params.dart';
import 'package:english_quiz_flutter/src/core/resources/data_state.dart';
import 'package:english_quiz_flutter/src/core/utils/helper.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/auth.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/usecases/request_send_sms_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends BlocWithState<AuthEvent, AuthState> {
  final SendAuthSMSUseCase _sendAuthSMSUseCase;
  AuthBloc(this._sendAuthSMSUseCase) : super(AuthInitial());

  Logger logger = Logger();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SendAuthSMS) yield* _requestSendAuthSMS(event);
  }

  Stream<AuthState> _requestSendAuthSMS(SendAuthSMS event) async* {
    yield* runBlocProcess(() async* {
      yield AuthLoading();
      final dataState = await _sendAuthSMSUseCase(params: AuthRequestParams(phoneNumber: event.phoneNumber));

      if (dataState is DataSuccess && dataState.data!.result.isNotEmpty) {
        final Auth auth = dataState.data!;
        MyToast myToast = const MyToast();
        //ToDo: Show proper message
        myToast(
          message: auth.result.toString(),
          toastColor: Colors.lightGreen,
        );
        yield AuthSuccess(
          auth: auth,
          fullname: event.fullname,
          phoneNumber: event.phoneNumber,
        );
      }
      if (dataState is DataFailed) {
        MyToast myToast = const MyToast();
        //ToDo: Show proper message
        myToast(
          message: dataState.error?.response.toString() ?? 'Unhandled Exception',
          toastColor: Colors.pink,
        );
        logger.d(dataState.error?.response.toString());
        yield AuthError(dataState.error!);
      }
    });
  }
}
