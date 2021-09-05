import 'dart:async';

import 'package:dio/dio.dart';
import 'package:english_quiz_flutter/src/core/bloc/bloc_with_state.dart';
import 'package:english_quiz_flutter/src/core/resources/data_state.dart';
import 'package:english_quiz_flutter/src/core/utils/helper.dart';
import 'package:english_quiz_flutter/src/features/authentication/core/params/user_info_request_params.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/user_info.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/usecases/get_user_info_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends BlocWithState<UserInfoEvent, UserInfoState> {
  final GetUserInfoUseCase _getUserInfoUseCase;
  UserInfoBloc(this._getUserInfoUseCase) : super(UserInfoInitial());

  @override
  Stream<UserInfoState> mapEventToState(
    UserInfoEvent event,
  ) async* {
    if (event is GetUserInfo) yield* _getUserInfo(event);
  }

  Stream<UserInfoState> _getUserInfo(GetUserInfo event) async* {
    yield* runBlocProcess(() async* {
      yield UserInfoLoading();
      final dataState = await _getUserInfoUseCase(
        params: UserInfoRequestParams(
          fullname: event.fullname,
          phoneNumber: event.phoneNumber,
          verifyCode: event.verifyCode,
        ),
      );
      if (dataState is DataSuccess &&
          dataState.data!.fullname.isNotEmpty &&
          dataState.data!.phoneNumber.isNotEmpty &&
          dataState.data!.token.isNotEmpty) {
        final UserInfo userInfo = dataState.data!;
        MyToast myToast = const MyToast();
        //ToDo: Show proper message
        myToast(
          message: 'Successful',
          toastColor: Colors.lightGreen,
        );
        yield UserInfoSuccess(userInfo);
      }
      if (dataState is DataFailed) {
        MyToast myToast = const MyToast();
        //ToDo: Show proper message
        myToast(
          message: dataState.error?.response.toString() ?? 'Unhandled Exception',
          toastColor: Colors.pink,
        );
        yield UserInfoError(dataState.error!);
      }
    });
  }
}
