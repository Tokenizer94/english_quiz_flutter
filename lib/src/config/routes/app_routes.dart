import 'package:english_quiz_flutter/src/features/login/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {

  static List<Route<dynamic>> onGenerateInitialRoute(String initialRouteName){
    return <Route>[_materialRoute(const LoginView())];
  }

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const LoginView());
      default:
        return _materialRoute(const LoginView());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
