import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/reset_password_view_model.dart';
import '../../../../constants/styles.dart';
import '../../../../core/models/base/base_stateless_widget.dart';
import '../../../../core/models/base/base_view.dart';
import '../../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../../../../widgets/appbar/appbar_transparent.dart';

class ResetPasswordScreen extends BaseStatelessWidget {
  bool _isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return BaseView<ResetPasswordViewModel>(
      viewModel: ResetPasswordViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<ResetPasswordViewModel>.value(
          value: viewModel,
          builder: (context, child) {
            return Scaffold(
              backgroundColor: ColorSchemeLight.kBackgroundColor,
              appBar: _buildAppBar(),
              body: _buildBody(),
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBarTransparent();

  Widget _buildBody() => NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            margin: const EdgeInsets.fromLTRB(25, 0, 25, 20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                _buildTitle(),
                const SizedBox(height: 10),
                _buildSubTitle(),
                const SizedBox(height: 40),
                _buildPasswordTextField(),
                const SizedBox(height: 20),
                _buildConfirmPasswordTextField(),
                const SizedBox(height: 60),
                _buildResetPasswordButton(),
              ],
            ),
          ),
        ),
      );

  Widget _buildTitle() => Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          "Reset\nPassword",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      );

  Widget _buildPasswordTextField() => Container(
        decoration: tTextFieldBoxDecoration,
        child: TextFormField(
          //focusNode: _passwordFocus,
          textInputAction: TextInputAction.go,
          maxLines: 1,
          obscureText: _isHiddenPassword,
          //controller: _passwordController,
          onFieldSubmitted: (value) {
            //_passwordFocus.unfocus();
            //_loginButtonOnClick();
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

  Widget _buildConfirmPasswordTextField() => Container(
        decoration: tTextFieldBoxDecoration,
        child: TextFormField(
          //focusNode: _passwordFocus,
          textInputAction: TextInputAction.go,
          maxLines: 1,
          obscureText: _isHiddenPassword,
          //controller: _passwordController,
          onFieldSubmitted: (value) {
            //_passwordFocus.unfocus();
            //_loginButtonOnClick();
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "* Required";
            } else {
              return null;
            }
          },
          decoration: tTextFieldInputDecoration("Confirm Password"),
        ),
      );

  Widget _buildResetPasswordButton() => SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: kLoginButtonButtonStyle,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Submit",
            style: kLoginButtonContentTextStyle,
          ),
        ),
      );

  Widget _buildSubTitle() => Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Enter your new password.",
          style: kSubTitleTextStyle,
          textAlign: TextAlign.start,
        ),
      );
}
