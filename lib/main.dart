import 'package:english_quiz_flutter/src/config/themes/app_theme.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/auth/auth_bloc.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/local_user_info/local_user_info_bloc.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/blocs/user_info/user_info_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'src/config/routes/app_routes.dart';
import 'src/injector.dart';

late LocalizationDelegate delegate;

Future<void> main() async {
  await startupSetup();
  runApp(
    LocalizedApp(
      delegate,
      MyApp(),
    ),
  );
}

Future<void> startupSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }
  delegate = await LocalizationDelegate.create(
    fallbackLocale: 'fa',
    supportedLocales: ['fa'],
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: ScreenUtilInit(
        builder: () {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (_) => injector(),
              ),
              BlocProvider<UserInfoBloc>(
                create: (_) => injector(),
              ),
              BlocProvider<LocalUserInfoBloc>(
                create: (_) => injector(),
              ),
            ],
            child: MaterialApp(
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                localizationDelegate,
              ],
              supportedLocales: localizationDelegate.supportedLocales,
              locale: localizationDelegate.currentLocale,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoutes.onGenerateRoutes,
              onGenerateInitialRoutes: AppRoutes.onGenerateInitialRoute,
              theme: AppTheme.dark,
            ),
          );
        },
      ),
    );
  }
}
