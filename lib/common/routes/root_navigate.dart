part of '../routes.dart';

class AppNavigate {
  static NavigatorState get _rootNavigator =>
      Navigator.of(App.rootNavigatorKey.currentContext!);

  static NavigatorState get _navigator => _rootNavigator;

  static Future pushNamed(
    String routeName, {
    Object? arguments,
    bool forceRootNavigator = false,
  }) {
    if (forceRootNavigator) {
      return _rootNavigator.pushNamed(
        routeName,
        arguments: arguments,
      );
    }

    return _navigator.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future pushReplacementNamed(String routeName) {
    return _navigator.pushReplacementNamed(routeName);
  }

  static Future<dynamic> push(Route<dynamic> route,
      {bool forceRootNavigator = false}) {
    if (forceRootNavigator) return _rootNavigator.push(route);
    return _navigator.push(route);
  }

  static Future<dynamic> popAndPushNamed(String routeName,
      {Object? arguments}) {
    return _navigator.popAndPushNamed(routeName, arguments: arguments);
  }

  static void pop() {
    return _navigator.pop();
  }
}
