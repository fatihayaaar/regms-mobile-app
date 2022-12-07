import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:provider/provider.dart';

import '../viewmodel/email_validate_view_model.dart';
import '../../../../constants/styles.dart';
import '../../../../core/models/base/base_stateless_widget.dart';
import '../../../../core/models/base/base_view.dart';
import '../../../../product/theme/theme_mode/light/color_scheme_light.dart';
import 'reset_password_screen.dart';
import '../../../../widgets/appbar/appbar_transparent.dart';

class EmailValidateScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<EmailValidateViewModel>(
      viewModel: EmailValidateViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<EmailValidateViewModel>.value(
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
                _buildVerificationTextField(),
                const SizedBox(height: 40),
                _buildLastTimeText(),
                const SizedBox(height: 10),
                _buildReSend(),
                const SizedBox(height: 40),
                _buildEmailValidateButton(),
              ],
            ),
          ),
        ),
      );

  Widget _buildTitle() => Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          "Email\nValidate",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      );

  Widget _buildEmailValidateButton() => SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: kLoginButtonButtonStyle,
          onPressed: () {
            Route route = MaterialPageRoute(builder: (_) => ResetPasswordScreen());
            Navigator.pushReplacement(context, route);
          },
          child: Text(
            "Verify",
            style: kLoginButtonContentTextStyle,
          ),
        ),
      );

  Widget _buildReSend() => Consumer<EmailValidateViewModel>(
        builder: (context, value, child) {
          return RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "If you didn't receive a code! ",
                  style: tsRichTextStyle(ColorSchemeLight.kBodyTextColor),
                ),
                TextSpan(
                  text: 'Resend',
                  style: tsRichTextStyle(value.g == true ? ColorSchemeLight.kLoginButtonColor : ColorSchemeLight.kBorderColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (value.start == 0) {
                        value.start = 120;
                        value.startTimer();
                      }
                    },
                ),
              ],
            ),
          );
        },
      );

  Widget _buildSubTitle() => Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Enter the verification code\nwe just send your email address.",
          style: kSubTitleTextStyle,
          textAlign: TextAlign.start,
        ),
      );

  Widget _buildVerificationTextField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 0, 15, 0),
      decoration: kBoxDecorationTextField,
      child: VerificationCode(
        fillColor: ColorSchemeLight.kTextFieldColor,
        textStyle: kHintTextStyle,
        keyboardType: TextInputType.number,
        underlineColor: ColorSchemeLight.kBorderColor,
        length: 4,
        onCompleted: (String value) {},
        onEditing: (bool value) {},
      ),
    );
  }

  Widget _buildLastTimeText() {
    return Consumer<EmailValidateViewModel>(
      builder: (context, value, child) {
        return Text(
          "${(value.start / 60).truncate()}:${(value.start % 60).toString().padLeft(2, '0')}",
          style: kSubTitleTextStyle,
        );
      },
    );
  }
}
