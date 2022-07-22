import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:regms_flutter_client/animations/fade_animation.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/screens/edit_profile_screen.dart';
import 'package:regms_flutter_client/screens/forgot_password_screen.dart';
import 'package:regms_flutter_client/screens/register_screen.dart';
import 'package:regms_flutter_client/widgets/app_bar/mini_app_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  late String _username;
  late String _password;
  bool _isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miniAppBar(color: Color.fromRGBO(0, 0, 0, 0)),
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          FadeAnimation(1.0, _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.18),
          _buildTitle(),
          SizedBox(height: 20),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.center,
      child: Text(
        "Login",
        style: tLoginTitleTextStyle,
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            _buildFormTextFields(),
            SizedBox(height: 10),
            _buildForgotPasswordLink(),
            SizedBox(height: 40),
            _buildLoginButton(),
            SizedBox(height: 25),
            _buildSignUp(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormTextFields() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Column(
        children: <Widget>[
          _buildUsernameTextField(),
          SizedBox(height: 15),
          _buildPasswordTextField(),
        ],
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return Container(
      decoration: tTextFieldBoxDecoration,
      child: TextFormField(
        focusNode: _usernameFocus,
        textInputAction: TextInputAction.go,
        maxLines: 1,
        controller: _usernameController,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _usernameFocus, _passwordFocus);
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
          _loginButtonOnClick();
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

  Widget _buildLoginButton() {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: kLoginButtonButtonStyle,
        onPressed: () {
          _loginButtonOnClick();
        },
        child: Text(
          "Login",
          style: kLoginButtonContentTextStyle,
        ),
      ),
    );
  }

  Widget _buildForgotPasswordLink() {
    return Container(
      width: double.infinity,
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Route route = MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
          Navigator.push(context, route);
        },
        child: Text(
          'Forgot password?',
          textAlign: TextAlign.right,
          style: tForgotPasswordTextStyle,
        ),
      ),
    );
  }

  Widget _buildSignUp() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t you have an account? ',
            style: tsRichTextStyle(kRegisterRichTextAboutColor),
          ),
          TextSpan(
            text: 'Register',
            style: tsRichTextStyle(kLoginButtonColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _togglePasswordView() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  void _loginButtonOnClick() {
    Route route = MaterialPageRoute(builder: (_) => EditProfileScreen());
    Navigator.push(context, route);
  }
}
