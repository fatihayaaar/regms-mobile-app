import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../../../product/base/base_service.dart';
import '../services/splash_service.dart';
import '../../../core/models/base/base_view_model.dart';
import '../../../main.dart';
import '../../../product/navigation/navigation.dart';

class SplashViewModel extends BaseViewModel<SplashService> {
  var context;

  SplashViewModel() {
    init();
  }

  void init() {
    navigateToPage();
  }

  void navigateToPage() {
    var token = appService.providerPersistHelper.getToken();
    tokenCheck(token).then((value) {
      if (value) {
        navigateToHome();
        return;
      }
      navigateToLogin();
    });
  }

  Future<bool> tokenCheck(token) async {
    if (token != null) {
      if (service != null) {
        await service!.tokenCheckService.check();
      }
    }
    return false;
  }

  void navigateToLogin() {
    appService.providerNavigationHelper.navigateToPage(
      path: Navigation.LOGIN_PAGE,
    );
  }

  void navigateToHome() {
    appService.providerNavigationHelper.navigateToPage(
      path: Navigation.HOME_PAGE,
    );
  }

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = SplashService(
      networkManager: context!.networkManager,
    );
  }
}
