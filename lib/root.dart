import 'package:regms_flutter_client/main.dart';
import 'package:regms_flutter_client/models/profile.dart';
import 'package:regms_flutter_client/models/user.dart';

class Root {
  User? myUser;

  Root() {
    initMyUser();
  }

  void initMyUser() {
    var username = prefs.getString("username");
    if (username != null) {
      if (username != "") {
        myUser = User(
            username: username,
            profile: Profile(avatar: "assets/images/dump_1.jpg"));
      }
    }
  }
}
