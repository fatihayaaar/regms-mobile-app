import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:regms_flutter_client/animations/fade_animation.dart';
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
      Center(
        child: Text(
          "Giriş Yap",
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
        child: _buildForm());
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            _buildFormTextFields(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15 - 50,
            ),
            _buildLoginButton(),
            SizedBox(height: 25),
            _buildForgotPasswordLink(),
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
            SizedBox(height: 30),
            _buildPasswordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return Container(
      height: 56,
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      height: 56,
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
    );
  }

  Widget _buildLoginButton() {
    return FadeAnimation(
      1.0,
      Container(
        height: 56,
        width: double.infinity,
        child: ElevatedButton(
          style: kBasicButtonButtonStyle,
          onPressed: () {
            _loginButtonOnClick();
          },
          child: Container(
            child: Text(
              "Giriş Yap",
              style: kButtonContentTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordLink() {
    return FadeAnimation(
      1.0,
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Şifrenizi mi ',
              style: TextStyle(
                height: 1.4,
                fontFamily: "SofiaPro",
                fontSize: 14,
                color: Color.fromRGBO(124, 125, 126, 1.0),
              ),
            ),
            TextSpan(
              text: 'unuttunuz?',
              style: TextStyle(
                height: 1.4,
                fontFamily: "SofiaPro",
                fontSize: 14,
                color: Color.fromRGBO(252, 96, 17, 1.0),
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
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
              text: 'Bir Hesabınız yok mu? ',
              style: TextStyle(
                height: 1.4,
                fontFamily: "SofiaPro",
                fontSize: 14,
                color: Color.fromRGBO(124, 125, 126, 1.0),
              ),
            ),
            TextSpan(
              text: 'Kayıt Ol',
              style: TextStyle(
                height: 1.4,
                fontFamily: "SofiaPro",
                fontSize: 14,
                color: Color.fromRGBO(252, 96, 17, 1.0),
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

  void _loginButtonOnClick() {}
}
