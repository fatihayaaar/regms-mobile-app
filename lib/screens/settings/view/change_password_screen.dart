import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles.dart';
import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../widgets/appbar/appbar_settings.dart';
import '../viewmodel/change_password_view_model.dart';

class ChangePasswordScreen extends BaseStatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  bool _isHiddenPassword = true;

  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ChangePasswordViewModel>(
      viewModel: ChangePasswordViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<ChangePasswordViewModel>.value(
          value: viewModel,
          builder: (context, child) {
            return Scaffold(
              appBar: _buildAppBar(),
              body: _buildBody(),
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() => const AppBarSettings(title: "Change Password");

  Widget _buildBody() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        _buildCurrentPasswordTextField(),
                        const SizedBox(height: 10),
                        _buildPasswordTextField(),
                        const SizedBox(height: 10),
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

  Widget _buildCurrentPasswordTextField() => Container(
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
            } else {
              return null;
            }
          },
          decoration: tTextFieldInputDecoration("Current Password"),
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
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "* Required";
            } else {
              return null;
            }
          },
          decoration: tTextFieldInputDecoration("New Password"),
        ),
      );

  Widget _buildRePasswordTextField() => Container(
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
            } else {
              return null;
            }
          },
          decoration: tTextFieldInputDecoration("Re-Password"),
        ),
      );

  Widget _buildSubmitButton() => Align(
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
