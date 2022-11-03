import 'package:flutter/material.dart';
import 'package:regms_flutter_client/root.dart';

import '../../../../product/network/auth/models/login_model/login_response_model/login_response_model.dart';
import '../../../../product/extensions/context_extension.dart';
import '../../../../core/models/base/base_view_model.dart';
import '../../../../main.dart';
import '../../../../product/base/base_service.dart';
import '../../../../product/navigation/navigation.dart';
import '../services/login_service.dart';

class LoginViewModel extends BaseViewModel<LoginService> {
  void loginButtonOnClick({required String username, required String password}) async {
    if (service != null) {
      login(username: username, password: password).then((value) {
        LoginResponseModel loginResponseModel = value;
        if (loginResponseModel.token != null) {
          if (loginResponseModel.token != "") {
            appService.providerPersistHelper.saveToken(loginResponseModel.token!);
            // Root.instance.myUser =
            navigateToProfile();
          }
        }
      });
    }
  }

  login({required username, required password}) async {
    service!.login(username: username, password: password);
  }

  navigateToProfile() {
    appService.providerNavigationHelper.navigateToReplacementPage(
      path: Navigation.PROFILE_PAGE,
      object: {
        "user": Root.instance.myUser,
        "isMyProfile": true,
      },
    );
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void setService(BaseService? service) {
    service = LoginService(
      networkManager: context!.networkManager,
    );
  }
}
