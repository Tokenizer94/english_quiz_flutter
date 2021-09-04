import 'package:english_quiz_flutter/src/features/authentication/data/datasources/remote/auth_api_service.dart';
import 'package:english_quiz_flutter/src/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/usecases/request_send_sms_usecase.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<AuthApiService>(AuthApiService(injector()));
  injector.registerSingleton<AuthRepository>(AuthRepositoryImpl(injector()));

  // UseCases
  injector.registerSingleton<SendAuthSMSUseCase>(SendAuthSMSUseCase(injector()));

  // Blocs
  injector.registerFactory<AuthBloc>(() => AuthBloc(injector()));
}
