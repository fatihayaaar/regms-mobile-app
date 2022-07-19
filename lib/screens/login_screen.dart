import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:regms_flutter_client/animations/fade_animation.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
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
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Stack(
        children: [
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        _buildTitle(),
        _buildContent(),
      ],
    );
  }

  Widget _buildTitle() {
    return FadeAnimation(
      1.0,
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
        alignment: Alignment.bottomLeft,
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
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
            SizedBox(height: 25),
            _buildLoginButton(),
            SizedBox(height: 25),
            _buildSignUp(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormTextFields() {
    return FadeAnimation(
      1.0,
      Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Column(
          children: <Widget>[
            _buildUsernameTextField(),
            SizedBox(height: 15),
            _buildPasswordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return TextFormField(
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
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: kTextLightColor),
        ),
        hintText: "Username",
        hintStyle: kHintTextStyle,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
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
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: kTextLightColor),
        ),
        hintText: "Password",
        hintStyle: kHintTextStyle,
      ),
    );
  }

  Widget _buildLoginButton() {
    return FadeAnimation(
      1.0,
      Container(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: kLoginButtonButtonStyle,
          onPressed: () {
            _loginButtonOnClick();
          },
          child: Container(
            child: Text(
              "Login",
              style: kLoginButtonContentTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordLink() {
    return FadeAnimation(
      1.0,
      Container(
        width: double.infinity,
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            'Forgot password?',
            textAlign: TextAlign.right,
            style: TextStyle(
              height: 1.4,
              fontSize: 14,
              color: kLoginButtonColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUp() {
    return FadeAnimation(
      1.0,
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t you have an account? ',
              style: TextStyle(
                height: 1.4,
                fontFamily: "SofiaPro",
                fontSize: 14,
                color: Color.fromRGBO(124, 125, 126, 1.0),
              ),
            ),
            TextSpan(
              text: 'Register',
              style: TextStyle(
                height: 1.4,
                fontFamily: "SofiaPro",
                fontSize: 14,
                color: kLoginButtonColor,
              ),
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

  void _loginButtonOnClick() {}
}
