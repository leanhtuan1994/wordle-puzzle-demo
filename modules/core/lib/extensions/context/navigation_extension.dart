part of '../extension.dart';

extension NavigationEx on BuildContext {
  ///  just call this [canPop()] method and it would return true if this route can be popped and false if it’s not possible.
  bool get canPop => Navigator.canPop(this);

  /// performs a simple [Navigator.pop] action and returns given [result]
  void pop<T>({result}) => Navigator.pop(this, result);

  /// perform push with routeName
  Future<dynamic> pushNamed(
    String screenName, {
    Object? arguments,
  }) async =>
      await Navigator.of(this).pushNamed(screenName, arguments: arguments);

  /// perform replace with routeName
  Future<dynamic> pushReplacementNamed(
    String screenName, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushReplacementNamed(screenName, arguments: arguments);
}
