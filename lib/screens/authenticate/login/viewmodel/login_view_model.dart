import 'package:flutter/material.dart';

import '../../../../product/network/auth/models/login_model/login_model.dart';
import '../../../../root.dart';
import '../../../../product/network/auth/models/login_model/login_response_model/login_response_model.dart';
import '../../../../product/extensions/context_extension.dart';
import '../../../../core/models/base/base_view_model.dart';
import '../../../../main.dart';
import '../../../../product/base/base_service.dart';
import '../../../../product/navigation/navigation.dart';
import '../services/login_service.dart';

class LoginViewModel extends BaseViewModel<LoginService> {
  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = LoginService(
      networkManager: context!.networkManager,
    );
  }

  void loginButtonOnClick({required String username, required String password}) async {
    final loginModel = LoginModel(username: username, password: password);
    if (service != null) {
      login(loginModel: loginModel).then((value) {
        LoginResponseModel? loginResponseModel = value;
        if (loginResponseModel != null) {
          if (loginResponseModel.token != null) {
            if (loginResponseModel.token != "") {
              appService.providerPersistHelper.saveToken(loginResponseModel.token!);
              // Root.instance.myUser =
              navigateToProfile();
            }
          }
        }
      });
    }
  }

  Future<LoginResponseModel?> login({required LoginModel loginModel}) async {
    return await service!.login(loginModel: loginModel);
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
}
