import 'package:flutter/material.dart';
import 'package:threads_clone/3_presentation/core/configs/routes/routes-name.config.dart';
import 'package:threads_clone/3_presentation/pages/auth/auth.page.dart';
import 'package:threads_clone/3_presentation/pages/home/home.page.dart';

class RoutesConfig {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNameConfig.authPage:
        {
          return MaterialPageRoute(builder: (context) => const AuthPage());
        }

      case RoutesNameConfig.homePage:
        {
          return MaterialPageRoute(builder: (context) => const HomePage());
        }

      default:
        {
          return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text('Route not found'))));
        }
    }
  }
}
