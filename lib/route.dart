import 'package:flutter/material.dart';
import 'package:regms_flutter_client/views/screens/edit_profile_screen.dart';
import 'package:regms_flutter_client/views/screens/main_screens/add_post_screen.dart';
import 'package:regms_flutter_client/views/screens/main_screens/home_screen/home_screen.dart';
import 'package:regms_flutter_client/views/screens/main_screens/profile_screen.dart';
import 'package:regms_flutter_client/views/screens/main_screens/search_screen.dart';
import 'package:regms_flutter_client/views/screens/main_screens/videos_screen.dart';
import 'package:regms_flutter_client/views/screens/membership_screens/confirm_password_screen.dart';
import 'package:regms_flutter_client/views/screens/membership_screens/email_validate_screen.dart';
import 'package:regms_flutter_client/views/screens/membership_screens/forgot_password_screen.dart';
import 'package:regms_flutter_client/views/screens/membership_screens/login_screen.dart';
import 'package:regms_flutter_client/views/screens/membership_screens/register_screen.dart';
import 'package:regms_flutter_client/views/screens/membership_screens/reset_password_screen.dart';
import 'package:regms_flutter_client/views/screens/notification_screen.dart';
import 'package:regms_flutter_client/views/screens/post_detail_screen.dart';
import 'package:regms_flutter_client/views/screens/starter_screen.dart';

class MyRoute {
  MyRoute._();

  static routes({param}) => <String, WidgetBuilder>{
        StarterScreen.routeName: (context) => StarterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
        EmailValidateScreen.routeName: (context) => EmailValidateScreen(),
        ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
        ConfirmPasswordScreen.routeName: (context) => ConfirmPasswordScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        VideosScreen.routeName: (context) => VideosScreen(),
        AddPostScreen.routeName: (context) => AddPostScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(
              user: param["user"],
              isMyProfile: param["isMyProfile"],
            ),
        EditProfileScreen.routeName: (context) => EditProfileScreen(),
        NotificationScreen.routeName: (context) => NotificationScreen(),
        PostDetailScreen.routeName: (context) => PostDetailScreen(
              post: param["post"],
            ),
      };

  static onGenerateRoute(dynamic routeName, {param}) {
    return MaterialPageRoute(
      builder: routes(param: param)[routeName],
    );
  }
}
