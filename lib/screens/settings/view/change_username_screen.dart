import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles.dart';
import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../widgets/appbar/appbar_settings.dart';
import '../viewmodel/change_username_view_model.dart';

class ChangeUsernameScreen extends BaseStatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BaseView<ChangeUsernameViewModel>(
      viewModel: ChangeUsernameViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<ChangeUsernameViewModel>.value(
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

  PreferredSizeWidget _buildAppBar() => const AppBarSettings(title: "Change Username");

  Widget _buildBody() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: Stack(
                children: [
                  _buildUsernameTextField(),
                  _buildSubmitButton(),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildUsernameTextField() => Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: tTextFieldBoxDecoration,
          child: TextFormField(
            focusNode: _usernameFocus,
            textInputAction: TextInputAction.go,
            maxLines: 1,
            controller: _usernameController,
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
            decoration: tTextFieldInputDecoration("New Username"),
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
            onPressed: () {},
            child: Text(
              "Submit",
              style: kLoginButtonContentTextStyle,
            ),
          ),
        ),
      );
}
