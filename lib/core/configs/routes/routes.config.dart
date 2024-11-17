import 'package:flutter/material.dart';
import 'package:threads_clone/core/configs/routes/routes-name.config.dart';
import 'package:threads_clone/presentation/auth/welcome.page.dart';
import 'package:threads_clone/presentation/home/pages/home.page.dart';

class RoutesConfig {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNameConfig.welcomePage:
        {
          return MaterialPageRoute(builder: (context) => const WelcomePage());
        }

      case RoutesNameConfig.homePage:
        {
          return MaterialPageRoute(builder: (context) => const HomePage());
        }

      default:
        {
          return MaterialPageRoute(
              builder: (context) =>
                  const Scaffold(body: Center(child: Text('Route not found'))));
        }
    }
  }
}
