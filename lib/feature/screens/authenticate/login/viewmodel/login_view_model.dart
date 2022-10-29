import 'package:flutter/material.dart';
import 'package:regms_flutter_client/product/navigation/navigation.dart';

class LoginViewModel with ChangeNotifier {
  var _appService;

  LoginViewModel({required appService}) {
    this._appService = appService;
  }

  void loginButtonOnClick(BuildContext context) async {
    await appService.providerPersistHelper.saveToken("fayar");
    appService.providerPersistHelper.initMyUser();
    appService.providerNavigationHelper.navigateToReplacementPage(
      path: Navigation.PROFILE_PAGE,
      object: {
        "user": appService.providerPersistHelper.myUser!,
        "isMyProfile": true,
      },
    );
  }

  get appService => _appService;

  set appService(value) {
    _appService = value;
    notifyListeners();
  }
}
