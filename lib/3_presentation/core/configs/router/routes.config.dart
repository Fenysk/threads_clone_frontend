import 'package:flutter/material.dart';
import 'package:threads_clone/3_presentation/core/configs/router/go-router-observer.dart';
import 'package:threads_clone/3_presentation/core/configs/router/routes-name.config.dart';
import 'package:threads_clone/3_presentation/pages/auth/auth.page.dart';
import 'package:threads_clone/3_presentation/pages/home/home.page.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/3_presentation/pages/root/root.page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class RoutesConfig {
  static final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesNameConfig.rootPage,
    observers: [
      GoRouterObserver(),
    ],
    routes: [
      GoRoute(
        name: RoutesNameConfig.authPage,
        path: RoutesNameConfig.authPage,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        name: RoutesNameConfig.homePage,
        path: RoutesNameConfig.homePage,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: RoutesNameConfig.rootPage,
        path: RoutesNameConfig.rootPage,
        builder: (context, state) => const RootPage(),
      ),
    ],
  );
}
