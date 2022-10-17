import 'package:flutter/material.dart';
import 'package:regms_flutter_client/view/screens/edit_profile_screen.dart';
import 'package:regms_flutter_client/view/screens/add_post_screen.dart';
import 'package:regms_flutter_client/view/screens/home_screen/home_screen.dart';
import 'package:regms_flutter_client/view/screens/profile_screen.dart';
import 'package:regms_flutter_client/view/screens/search_screen.dart';
import 'package:regms_flutter_client/view/screens/videos_screen.dart';
import 'package:regms_flutter_client/view/screens/authenticate/view/confirm_password_screen.dart';
import 'package:regms_flutter_client/view/screens/authenticate/view/email_validate_screen.dart';
import 'package:regms_flutter_client/view/screens/authenticate/view/forgot_password_screen.dart';
import 'package:regms_flutter_client/view/screens/authenticate/view/login_screen.dart';
import 'package:regms_flutter_client/view/screens/authenticate/view/register_screen.dart';
import 'package:regms_flutter_client/view/screens/authenticate/view/reset_password_screen.dart';
import 'package:regms_flutter_client/view/screens/notification_screen.dart';
import 'package:regms_flutter_client/view/screens/post_detail_screen.dart';
import 'package:regms_flutter_client/view/screens/starter_screen.dart';
import 'package:regms_flutter_client/core/services/constants/navigation.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    Map? data = settings.arguments as Map;

    switch (settings.name) {
      case Navigation.STARTER_PAGE:
        return navigate(StarterScreen());
      case Navigation.LOGIN_PAGE:
        return navigate(LoginScreen());
      case Navigation.REGISTER_PAGE:
        return navigate(RegisterScreen());
      case Navigation.FORGOT_PASSWORD_PAGE:
        return navigate(ForgotPasswordScreen());
      case Navigation.EMAIL_VALIDATE_PAGE:
        return navigate(EmailValidateScreen());
      case Navigation.RESET_PASSWORD_PAGE:
        return navigate(ResetPasswordScreen());
      case Navigation.CONFIRM_PASSWORD_PAGE:
        return navigate(ConfirmPasswordScreen());
      case Navigation.HOME_PAGE:
        return navigate(HomeScreen());
      case Navigation.VIDEOS_PAGE:
        return navigate(VideosScreen());
      case Navigation.ADD_POST_PAGE:
        return navigate(AddPostScreen());
      case Navigation.SEARCH_PAGE:
        return navigate(SearchScreen());
      case Navigation.PROFILE_PAGE:
        return navigate(ProfileScreen(
          user: data["user"],
          isMyProfile: data["isMyProfile"],
        ));
      case Navigation.EDIT_PROFILE_PAGE:
        return navigate(EditProfileScreen());
      case Navigation.NOTIFICATION_PAGE:
        return navigate(NotificationScreen());
      case Navigation.POST_DETAIL_PAGE:
        return navigate(PostDetailScreen(
          post: data["post"],
        ));
    }
    return navigate(StarterScreen());
  }

  MaterialPageRoute navigate(widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
