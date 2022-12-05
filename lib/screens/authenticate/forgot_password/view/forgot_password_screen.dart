import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import '../../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../../../../widgets/appbar/appbar_transparent.dart';
import 'email_validate_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/starter/forgot_password';

  @override
  _ForgotPasswordScreen createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTransparent(),
      backgroundColor: ColorSchemeLight.kBackgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() => NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            margin: const EdgeInsets.fromLTRB(25, 0, 25, 20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                _buildTitle(),
                const SizedBox(height: 10),
                _buildSubTitle(),
                const SizedBox(height: 40),
                _buildUsernameTextField(),
                const SizedBox(height: 60),
                _buildForgotPasswordButton(),
              ],
            ),
          ),
        ),
      );

  Widget _buildTitle() => Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          "Forgot\nPassword",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      );

  Widget _buildUsernameTextField() => Container(
        decoration: tTextFieldBoxDecoration,
        child: TextFormField(
          //focusNode: _usernameFocus,
          textInputAction: TextInputAction.go,
          maxLines: 1,
          //controller: _usernameController,
          onFieldSubmitted: (term) {
            //_fieldFocusChange(context, _usernameFocus, _passwordFocus);
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "* Required";
            } else {
              return null;
            }
          },
          decoration: tTextFieldInputDecoration("Username"),
        ),
      );

  Widget _buildForgotPasswordButton() => SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: kLoginButtonButtonStyle,
          onPressed: () {
            Route route = MaterialPageRoute(builder: (_) => EmailValidateScreen());
            Navigator.pushReplacement(context, route);
          },
          child: Text(
            "Send",
            style: kLoginButtonContentTextStyle,
          ),
        ),
      );

  Widget _buildSubTitle() => Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Enter your username.",
          style: kSubTitleTextStyle,
          textAlign: TextAlign.start,
        ),
      );
}
