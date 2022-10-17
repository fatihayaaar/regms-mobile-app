import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/main.dart';
import 'package:regms_flutter_client/view_models/membership/login_view_model.dart';
import 'package:regms_flutter_client/views/widgets/appbar/appbar_transparent.dart';
import 'package:regms_flutter_client/core/services/constants/navigation.dart';
import 'package:regms_flutter_client/core/utils/app_localization.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State {
  var translate;
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
    translate = AppLocalizations.of(context)!.translate;
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return LoginViewModel(appService: appService);
      },
      child: Scaffold(
        appBar: AppBarTransparent(),
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.18),
            _buildTitle(),
            SizedBox(height: 20),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.center,
      child: Text(
        translate("login_title"),
        style: Theme.of(context).textTheme.headline1,
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
          Provider.of<LoginViewModel>(
            context,
            listen: false,
          ).loginButtonOnClick(context);
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
          Provider.of<LoginViewModel>(
            context,
            listen: false,
          ).loginButtonOnClick(context);
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
          appService.providerNavigationHelper.navigateToPage(
            path: Navigation.FORGOT_PASSWORD_PAGE,
          );
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
                appService.providerNavigationHelper.navigateToPage(
                  path: Navigation.REGISTER_PAGE,
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
}
