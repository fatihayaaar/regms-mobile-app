import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../widgets/appbar/appbar_settings.dart';
import '../../authenticate/forgot_password/view/confirm_password_screen.dart';

class ChangeEmailScreen extends StatefulWidget {
  @override
  _ChangeEmailScreen createState() => _ChangeEmailScreen();
}

class _ChangeEmailScreen extends State {
  final TextEditingController _emailAddressController = TextEditingController();
  final FocusNode _emailAddressFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSettings(title: "Change Email"),
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
                _buildEmailAddressTextField(),
                _buildSubmitButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailAddressTextField() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: tTextFieldBoxDecoration,
        child: TextFormField(
          focusNode: _emailAddressFocus,
          textInputAction: TextInputAction.go,
          maxLines: 1,
          controller: _emailAddressController,
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
          decoration: tTextFieldInputDecoration("New Email Address"),
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
          onPressed: () {
            Route route = MaterialPageRoute(builder: (_) => ConfirmPasswordScreen());
            Navigator.push(context, route);
          },
          child: Text(
            "Submit",
            style: kLoginButtonContentTextStyle,
          ),
        ),
      ),
    );
  }
}
