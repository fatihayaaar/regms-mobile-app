import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/settings_drawer.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  @override
  _ConfirmPasswordScreen createState() => _ConfirmPasswordScreen();
}

class _ConfirmPasswordScreen extends State {
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  bool _isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _build(),
    );
  }

  Widget _build() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 28),
          buildDrawerHeader(context: context, title: "Confirm Password"),
          SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: _buildPasswordTextField(),
                ),
                _buildSubmitButton(),
              ],
            ),
          ),
        ],
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
        decoration: tTextFieldInputDecoration("Password"),
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
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Confirm",
            style: kLoginButtonContentTextStyle,
          ),
        ),
      ),
    );
  }
}
