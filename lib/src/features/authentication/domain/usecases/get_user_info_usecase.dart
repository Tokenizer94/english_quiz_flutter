import 'package:english_quiz_flutter/src/core/resources/data_state.dart';
import 'package:english_quiz_flutter/src/core/usecases/usecase.dart';
import 'package:english_quiz_flutter/src/features/authentication/core/params/user_info_request_params.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/user_info.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/repositories/auth_repository.dart';

class GetUserInfoUseCase implements UseCase<DataState<UserInfo>, UserInfoRequestParams> {
  final AuthRepository _authRepository;
  GetUserInfoUseCase(this._authRepository);

  @override
  Future<DataState<UserInfo>> call({required UserInfoRequestParams params}) {
    return _authRepository.getUserInfo(params);
  }
}
