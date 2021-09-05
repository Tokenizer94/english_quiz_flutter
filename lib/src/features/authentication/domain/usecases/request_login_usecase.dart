import 'package:english_quiz_flutter/src/core/resources/data_state.dart';
import 'package:english_quiz_flutter/src/core/usecases/usecase.dart';
import 'package:english_quiz_flutter/src/features/authentication/core/params/login_request_params.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/user_info.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<DataState<UserInfo>, LoginRequestParams> {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  @override
  Future<DataState<UserInfo>> call({required LoginRequestParams params}) {
    return _authRepository.requestLogin(params);
  }
}
