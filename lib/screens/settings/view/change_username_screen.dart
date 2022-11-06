import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../widgets/appbar/appbar_settings.dart';

class ChangeUsernameScreen extends StatefulWidget {
  @override
  _ChangeUsernameScreen createState() => _ChangeUsernameScreen();
}

class _ChangeUsernameScreen extends State {
  final TextEditingController _usernameController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSettings(title: "Change Username"),
      body: _build(),
    );
  }

  Widget _build() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: [
                _buildUsernameTextField(),
                _buildSubmitButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: tTextFieldBoxDecoration,
        child: TextFormField(
          focusNode: _usernameFocus,
          textInputAction: TextInputAction.go,
          maxLines: 1,
          controller: _usernameController,
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
          decoration: tTextFieldInputDecoration("New Username"),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
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