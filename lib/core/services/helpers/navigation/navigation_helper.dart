import 'package:flutter/cupertino.dart';

class NavigationHelper {
  static final NavigationHelper _instance = NavigationHelper._init();

  static NavigationHelper get instance => _instance;

  NavigationHelper._init();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  Future<void> navigateToPage({required String path, Object? object}) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: object);
  }

  Future<void> navigateToReplacementPage({required String path, Object? object}) async {
    await navigatorKey.currentState?.pushReplacementNamed(
      path,
      arguments: object,
    );
  }

  Future<void> navigateToPageRemove({required String path, Object? object}) async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      path,
      removeAllOldRoutes,
      arguments: object,
    );
  }
}