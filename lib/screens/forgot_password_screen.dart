import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/screens/email_validate_screen.dart';
import 'package:regms_flutter_client/widgets/app_bar/mini_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreen createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miniAppBar(),
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
              _buildUsernameTextField(),
              SizedBox(height: 60),
              _buildForgotPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      child: Text("Forgot\nPassword", style: tRegisterTitleTextStyle),
      alignment: Alignment.bottomLeft,
    );
  }

  Widget _buildUsernameTextField() {
    return Container(
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
          } else
            return null;
        },
        decoration: tTextFieldInputDecoration("Username"),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: kLoginButtonButtonStyle,
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (_) => EmailValidateScreen());
          Navigator.pushReplacement(context, route);
        },
        child: Text(
          "Send",
          style: kLoginButtonContentTextStyle,
        ),
      ),
    );
  }

  _buildSubTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Enter your username.",
        style: kSubTitleTextStyle,
        textAlign: TextAlign.start,
      ),
    );
  }
}
