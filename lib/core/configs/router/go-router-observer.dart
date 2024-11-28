import 'package:flutter/material.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    print('didPop: ${route.settings.name}. previousRoute: ${previousRoute?.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('didPush: ${route.settings.name}. previousRoute: ${previousRoute?.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('didRemove: ${route.settings.name}. previousRoute: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('didReplace: ${newRoute?.settings.name}. oldRoute: ${oldRoute?.settings.name}');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    print('didStartUserGesture: ${route.settings.name}. previousRoute: ${previousRoute?.settings.name}');
  }

  @override
  void didStopUserGesture() {
    print('didStopUserGesture');
  }

  @override
  NavigatorState? get navigator => null;
}
