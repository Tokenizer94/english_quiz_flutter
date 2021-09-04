import 'package:english_quiz_flutter/src/features/authentication/presentation/views/login_view.dart';
import 'package:english_quiz_flutter/src/features/authentication/presentation/views/verify_code.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static List<Route<dynamic>> onGenerateInitialRoute(String initialRouteName) {
    return <Route>[_materialRoute(const LoginView())];
  }

  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const LoginView());
      case '/verifyCode':
        return _materialRoute(const VerifyCodeView());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
