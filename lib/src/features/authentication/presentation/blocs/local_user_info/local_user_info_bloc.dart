import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_quiz_flutter/src/features/authentication/core/params/user_info_params.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/user_info.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/usecases/save_user_info_usecase.dart';
import 'package:equatable/equatable.dart';

part 'local_user_info_event.dart';
part 'local_user_info_state.dart';

class LocalUserInfoBloc extends Bloc<LocalUserInfoEvent, LocalUserInfoState> {
  final SaveUserInfoUseCase _saveUserInfoUseCase;
  LocalUserInfoBloc(
    this._saveUserInfoUseCase,
  ) : super(LocalUserInfoLoading());

  @override
  Stream<LocalUserInfoState> mapEventToState(LocalUserInfoEvent event) async* {
    if (event is SaveUserInfo) {
      await _saveUserInfoUseCase(params: UserInfoParams(userInfo: event.userInfo));
      yield LocalUserInfoDone(userInfo: event.userInfo);
    }
  }
}
