import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/change_email_view_model.dart';

import '../../../constants/styles.dart';
import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../widgets/appbar/appbar_settings.dart';
import '../../authenticate/forgot_password/view/confirm_password_screen.dart';

class ChangeEmailScreen extends BaseStatelessWidget {
  final TextEditingController _emailAddressController = TextEditingController();
  final FocusNode _emailAddressFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BaseView<ChangeEmailViewModel>(
      viewModel: ChangeEmailViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<ChangeEmailViewModel>.value(
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

  PreferredSizeWidget _buildAppBar() => const AppBarSettings(title: "Change Email");

  Widget _buildBody() => Container(
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

  Widget _buildEmailAddressTextField() => Align(
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

  Widget _buildSubmitButton() => Align(
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
