import 'dart:math';

import 'package:flutter/material.dart';

import '../../screens/home/view/home_screen.dart';
import '../../screens/other/view/notification_screen.dart';
import '../../screens/other/view/search_screen.dart';
import '../../screens/other/view/videos_screen.dart';
import '../../screens/profile/view/edit_profile_screen.dart';
import '../../screens/post/view/add_post_screen.dart';
import '../../screens/profile/view/profile_screen.dart';
import '../../screens/authenticate/forgot_password/view/confirm_password_screen.dart';
import '../../screens/authenticate/forgot_password/view/email_validate_screen.dart';
import '../../screens/authenticate/forgot_password/view/forgot_password_screen.dart';
import '../../screens/authenticate/login/view/login_screen.dart';
import '../../screens/authenticate/register/view/register_screen.dart';
import '../../screens/authenticate/forgot_password/view/reset_password_screen.dart';
import '../../screens/post/view/post_detail_screen.dart';
import '../../screens/splash/view/splash.dart';
import '../../screens/starter/view/starter_screen.dart';
import 'navigation.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    Map? data;
    if (settings.arguments != null) {
      data = settings.arguments as Map;
    }

    switch (settings.name) {
      case Navigation.DEFAULT:
        return navigate(Splash());
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
          user: data!["user"],
          isMyProfile: data["isMyProfile"],
        ));
      case Navigation.EDIT_PROFILE_PAGE:
        return navigate(EditProfileScreen());
      case Navigation.NOTIFICATION_PAGE:
        return navigate(NotificationScreen());
      case Navigation.POST_DETAIL_PAGE:
        return navigate(PostDetailScreen(
          post: data!["post"],
        ));
    }
    return navigate(StarterScreen());
  }

  MaterialPageRoute navigate(widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
