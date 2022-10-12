import 'package:flutter/material.dart';
import 'package:regms_flutter_client/mvvm/views/screens/main_screens/profile_screen.dart';
import 'package:regms_flutter_client/route.dart';

class LoginViewModel with ChangeNotifier {
  var _appService;

  LoginViewModel({required appService}) {
    this._appService = appService;
  }

  void loginButtonOnClick(BuildContext context) async {
    await appService.providerPersistHelper.saveToken("fayar");
    appService.providerPersistHelper.initMyUser();
    var route = MyRoute.onGenerateRoute(
      ProfileScreen.routeName,
      param: {
        "user": appService.providerPersistHelper.myUser!,
        "isMyProfile": true,
      },
    );
    Navigator.pushReplacement(context, route);
  }

  get appService => _appService;

  set appService(value) {
    _appService = value;
    notifyListeners();
  }
}
