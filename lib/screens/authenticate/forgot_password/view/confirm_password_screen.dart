import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/confirm_password_view_model.dart';
import '../../../../constants/styles.dart';
import '../../../../core/models/base/base_stateless_widget.dart';
import '../../../../core/models/base/base_view.dart';
import '../../../../widgets/appbar/appbar_settings.dart';

class ConfirmPasswordScreen extends BaseStatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  bool _isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return BaseView<ConfirmPasswordViewModel>(
      viewModel: ConfirmPasswordViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<ConfirmPasswordViewModel>.value(
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

  PreferredSizeWidget _buildAppBar() => const AppBarSettings(title: "Confirm Password");

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
                    child: _buildPasswordTextField(),
                  ),
                  _buildSubmitButton(),
                ],
              ),
            ),
          ],
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
          decoration: tTextFieldInputDecoration("Password"),
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
