import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import '../../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../../../../widgets/appbar/appbar_transparent.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = '/starter/forgot_password/reset_password';

  @override
  _ResetPasswordScreen createState() => _ResetPasswordScreen();
}

class _ResetPasswordScreen extends State {
  bool _isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTransparent(),
      backgroundColor: ColorSchemeLight.kBackgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return NotificationListener<OverscrollIndicatorNotification>(
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
              _buildPasswordTextField(),
              const SizedBox(height: 20),
              _buildConfirmPasswordTextField(),
              const SizedBox(height: 60),
              _buildResetPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        "Reset\nPassword",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      decoration: tTextFieldBoxDecoration,
      child: TextFormField(
        //focusNode: _passwordFocus,
        textInputAction: TextInputAction.go,
        maxLines: 1,
        obscureText: _isHiddenPassword,
        //controller: _passwordController,
        onFieldSubmitted: (value) {
          //_passwordFocus.unfocus();
          //_loginButtonOnClick();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "* Required";
          } else {
            return null;
          }
        },
        decoration: tTextFieldInputDecoration("Password"),
      ),
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return Container(
      decoration: tTextFieldBoxDecoration,
      child: TextFormField(
        //focusNode: _passwordFocus,
        textInputAction: TextInputAction.go,
        maxLines: 1,
        obscureText: _isHiddenPassword,
        //controller: _passwordController,
        onFieldSubmitted: (value) {
          //_passwordFocus.unfocus();
          //_loginButtonOnClick();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "* Required";
          } else {
            return null;
          }
        },
        decoration: tTextFieldInputDecoration("Confirm Password"),
      ),
    );
  }

  Widget _buildResetPasswordButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: kLoginButtonButtonStyle,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Submit",
          style: kLoginButtonContentTextStyle,
        ),
      ),
    );
  }

  _buildSubTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Enter your new password.",
        style: kSubTitleTextStyle,
        textAlign: TextAlign.start,
      ),
    );
  }
}
