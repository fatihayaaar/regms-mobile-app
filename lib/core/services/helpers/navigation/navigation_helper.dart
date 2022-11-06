import 'package:flutter/cupertino.dart';

class NavigationHelper {
  static final NavigationHelper _instance = NavigationHelper._init();

  static NavigationHelper get instance => _instance;

  NavigationHelper._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  Future<void> navigateToPage({required path, Object? object}) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: object);
  }

  Future<void> navigateToReplacementPage({required path, Object? object}) async {
    await navigatorKey.currentState?.pushReplacementNamed(
      path,
      arguments: object,
    );
  }

  Future<void> navigateToPageRemove({required path, Object? object}) async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      path,
      removeAllOldRoutes,
      arguments: object,
    );
  }
}
