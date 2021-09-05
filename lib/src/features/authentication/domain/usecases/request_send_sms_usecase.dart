import 'package:english_quiz_flutter/src/features/authentication/core/params/auth_request_params.dart';
import 'package:english_quiz_flutter/src/core/resources/data_state.dart';
import 'package:english_quiz_flutter/src/core/usecases/usecase.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/auth.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/repositories/auth_repository.dart';

class SendAuthSMSUseCase implements UseCase<DataState<Auth>, AuthRequestParams> {
  final AuthRepository _authRepository;

  SendAuthSMSUseCase(this._authRepository);
  
  @override
  Future<DataState<Auth>> call({required AuthRequestParams params}) {
    return _authRepository.requestSendAuthSMS(params);
  }
}
