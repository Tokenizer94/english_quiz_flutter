import 'package:english_quiz_flutter/src/core/usecases/usecase.dart';
import 'package:english_quiz_flutter/src/features/authentication/core/params/user_info_params.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/repositories/auth_repository.dart';

class SaveUserInfoUseCase implements UseCase<void, UserInfoParams> {
  final AuthRepository _authRepository;
  SaveUserInfoUseCase(this._authRepository);

  @override
  Future<void> call({required UserInfoParams params}) {
    return _authRepository.saveUserInfo(params.userInfo);
  }
}
