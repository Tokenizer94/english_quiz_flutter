import 'package:dio/dio.dart';
import 'package:english_quiz_flutter/src/core/datasources/local/app_database.dart';
import 'package:english_quiz_flutter/src/features/authentication/data/datasources/remote/auth_api_service.dart';
import 'package:english_quiz_flutter/src/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/usecases/get_user_info_usecase.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/usecases/request_send_sms_usecase.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/usecases/save_user_info_usecase.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/auth/auth_bloc.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/local_user_info/local_user_info_bloc.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/user_info/user_info_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/constants.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);

  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<AuthApiService>(AuthApiService(injector()));
  injector.registerSingleton<AuthRepository>(AuthRepositoryImpl(injector(), injector()));

  // UseCases
  injector.registerSingleton<SendAuthSMSUseCase>(SendAuthSMSUseCase(injector()));
  injector.registerSingleton<GetUserInfoUseCase>(GetUserInfoUseCase(injector()));
  injector.registerSingleton<SaveUserInfoUseCase>(SaveUserInfoUseCase(injector()));

  // Blocs
  injector.registerFactory<AuthBloc>(() => AuthBloc(injector()));
  injector.registerFactory<UserInfoBloc>(() => UserInfoBloc(injector()));
  injector.registerFactory<LocalUserInfoBloc>(() => LocalUserInfoBloc(injector()));
}
