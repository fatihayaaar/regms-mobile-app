import 'package:regms_flutter_client/services/helpers/navigation/navigation_helper.dart';

abstract class NavigationModule {
  NavigationHelper get providerNavigationHelper;
}

class NavigatorModule {
  NavigationHelper providerNavigationHelper() => NavigationHelper.instance;
}
