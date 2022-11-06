import 'main.dart';
import 'models/profile/profile.dart';
import 'models/user/user.dart';

class Root {
  static Root? _instance;
  User? myUser;

  static Root get instance {
    _instance ??= Root._();
    return _instance!;
  }

  Root._() {
    final username = appService.providerPersistHelper.getUsername();
    if (username == null) {
      myUser = User.empty();
    } else {
      myUser = User(
        username: username,
        profile: Profile(),
      );
    }
  }
}
