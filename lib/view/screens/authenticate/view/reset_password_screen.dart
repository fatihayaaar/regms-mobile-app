import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/view/widgets/appbar/appbar_transparent.dart';

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
      backgroundColor: kBackgroundColor,
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
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.18),
              _buildTitle(),
              SizedBox(height: 10),
              _buildSubTitle(),
              SizedBox(height: 40),
              _buildPasswordTextField(),
              SizedBox(height: 20),
              _buildConfirmPasswordTextField(),
              SizedBox(height: 60),
              _buildResetPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      child: Text(
        "Reset\nPassword",
        style: Theme.of(context).textTheme.headline2,
      ),
      alignment: Alignment.bottomLeft,
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
          } else
            return null;
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
          } else
            return null;
        },
        decoration: tTextFieldInputDecoration("Confirm Password"),
      ),
    );
  }

  Widget _buildResetPasswordButton() {
    return Container(
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
