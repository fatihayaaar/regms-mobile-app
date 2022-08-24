import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar_settings.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreen createState() => _ChangePasswordScreen();
}

class _ChangePasswordScreen extends State {
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  bool _isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettings(title: "Change Password"),
      body: _build(),
    );
  }

  Widget _build() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      _buildCurrentPasswordTextField(),
                      SizedBox(height: 10),
                      _buildPasswordTextField(),
                      SizedBox(height: 10),
                      _buildRePasswordTextField(),
                    ],
                  ),
                ),
                _buildSubmitButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPasswordTextField() {
    return Container(
      decoration: tTextFieldBoxDecoration,
      child: TextFormField(
        focusNode: _passwordFocus,
        textInputAction: TextInputAction.go,
        maxLines: 1,
        obscureText: _isHiddenPassword,
        controller: _passwordController,
        onFieldSubmitted: (value) {
          _passwordFocus.unfocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "* Required";
          } else
            return null;
        },
        decoration: tTextFieldInputDecoration("Current Password"),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      decoration: tTextFieldBoxDecoration,
      child: TextFormField(
        focusNode: _passwordFocus,
        textInputAction: TextInputAction.go,
        maxLines: 1,
        obscureText: _isHiddenPassword,
        controller: _passwordController,
        onFieldSubmitted: (value) {
          _passwordFocus.unfocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "* Required";
          } else
            return null;
        },
        decoration: tTextFieldInputDecoration("New Password"),
      ),
    );
  }

  Widget _buildRePasswordTextField() {
    return Container(
      decoration: tTextFieldBoxDecoration,
      child: TextFormField(
        focusNode: _passwordFocus,
        textInputAction: TextInputAction.go,
        maxLines: 1,
        obscureText: _isHiddenPassword,
        controller: _passwordController,
        onFieldSubmitted: (value) {
          _passwordFocus.unfocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "* Required";
          } else
            return null;
        },
        decoration: tTextFieldInputDecoration("Re-Password"),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: kLoginButtonButtonStyle,
          onPressed: () {},
          child: Text(
            "Submit",
            style: kLoginButtonContentTextStyle,
          ),
        ),
      ),
    );
  }
}
