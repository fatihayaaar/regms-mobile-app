import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../../../constants/styles.dart';
import '../../../../product/theme/theme_mode/light/color_scheme_light.dart';
import 'reset_password_screen.dart';
import '../../../../widgets/appbar/appbar_transparent.dart';

class EmailValidateScreen extends StatefulWidget {
  static const routeName = '/starter/forgot_password/email_validate';

  @override
  _EmailValidateScreen createState() => _EmailValidateScreen();
}

class _EmailValidateScreen extends State {
  late Timer _timer;
  int _start = 120;
  late bool _timerStart = true;
  late bool _g;

  @override
  void initState() {
    super.initState();
    _g = false;
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarTransparent(),
        backgroundColor: ColorSchemeLight.kBackgroundColor,
        body: _buildBody(),
      );

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

  Widget _buildReSend() => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "If you didn't receive a code! ",
              style: tsRichTextStyle(ColorSchemeLight.kBodyTextColor),
            ),
            TextSpan(
              text: 'Resend',
              style: tsRichTextStyle(_g == true ? ColorSchemeLight.kLoginButtonColor : ColorSchemeLight.kBorderColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (_start == 0) {
                    _start = 120;
                    startTimer();
                  }
                },
            ),
          ],
        ),
      );

  Widget _buildSubTitle() => Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Enter the verification code\nwe just send your email address.",
          style: kSubTitleTextStyle,
          textAlign: TextAlign.start,
        ),
      );

  void startTimer() {
    if (_timerStart) {
      _timerStart = false;
      const oneSec = Duration(seconds: 1);
      _timer = Timer.periodic(
        oneSec,
        (Timer timer) {
          if (_start == 0) {
            setState(() {
              _g = true;
              _timerStart = true;
              timer.cancel();
            });
          } else {
            setState(() {
              _g = false;
              _start--;
            });
          }
        },
      );
    }
  }

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
        onCompleted: (String value) {
          setState(() {});
        },
        onEditing: (bool value) {
          setState(() {});
        },
      ),
    );
  }

  Widget _buildLastTimeText() {
    return Text(
      "${(_start / 60).truncate()}:${(_start % 60).toString().padLeft(2, '0')}",
      style: kSubTitleTextStyle,
    );
  }
}
