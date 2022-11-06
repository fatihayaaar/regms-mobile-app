import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/styles.dart';
import '../../../../core/models/base/base_stateless_widget.dart';
import '../../../../core/models/base/base_view.dart';
import '../../../../main.dart';
import '../../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../viewmodel/login_view_model.dart';
import '../../../../widgets/appbar/appbar_transparent.dart';
import '../../../../product/navigation/navigation.dart';

class LoginScreen extends BaseStatelessWidget {
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
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<LoginViewModel>.value(
          value: viewModel,
          builder: (context, child) {
            return Scaffold(
              appBar: _buildAppBar(),
              backgroundColor: ColorSchemeLight.kBackgroundColor,
              body: _buildBody(),
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget? _buildAppBar() => AppBarTransparent();

  Widget _buildBody() => NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.18),
              _buildTitle(),
              const SizedBox(height: 20),
              _buildContent(),
            ],
          ),
        ),
      );

  Widget _buildTitle() => Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        alignment: Alignment.center,
        child: Text(
          translate("login_title"),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      );

  Widget _buildContent() => Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
        child: _buildForm(),
      );

  Widget _buildForm() => Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: [
              _buildFormTextFields(),
              const SizedBox(height: 10),
              _buildForgotPasswordLink(),
              const SizedBox(height: 40),
              _buildLoginButton(),
              const SizedBox(height: 25),
              _buildSignUp(),
            ],
          ),
        ),
      );

  Widget _buildFormTextFields() => Container(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Column(
          children: <Widget>[
            _buildUsernameTextField(),
            const SizedBox(height: 15),
            _buildPasswordTextField(),
          ],
        ),
      );

  Widget _buildUsernameTextField() => Container(
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
            } else {
              return null;
            }
          },
          decoration: tTextFieldInputDecoration("Username"),
        ),
      );

  Widget _buildPasswordTextField() => Container(
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
            ).loginButtonOnClick(username: "", password: "");
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "* Required";
            } else {
              return null;
            }
          },
          decoration: tTextFieldInputDecoration("Password"),
        ),
      );

  Widget _buildLoginButton() => SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: kLoginButtonButtonStyle,
          onPressed: () {
            Provider.of<LoginViewModel>(
              context,
              listen: false,
            ).loginButtonOnClick(username: "", password: "");
          },
          child: Text(
            "Login",
            style: kLoginButtonContentTextStyle,
          ),
        ),
      );

  Widget _buildForgotPasswordLink() => Container(
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

  Widget _buildSignUp() => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t you have an account? ',
              style: tsRichTextStyle(ColorSchemeLight.kRegisterRichTextAboutColor),
            ),
            TextSpan(
              text: 'Register',
              style: tsRichTextStyle(ColorSchemeLight.kLoginButtonColor),
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

  void _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _togglePasswordView() {
    // setState(() {
    //   _isHiddenPassword = !_isHiddenPassword;
    // });
  }
}
