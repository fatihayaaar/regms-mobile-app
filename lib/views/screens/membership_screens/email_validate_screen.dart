import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/views/screens/membership_screens/reset_password_screen.dart';
import 'package:regms_flutter_client/views/widgets/appbar/appbar_transparent.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTransparent(),
      backgroundColor: kBackgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.18),
              _buildTitle(),
              SizedBox(height: 10),
              _buildSubTitle(),
              SizedBox(height: 40),
              _buildVerificationTextField(),
              SizedBox(height: 40),
              _buildLastTimeText(),
              SizedBox(height: 10),
              _buildReSend(),
              SizedBox(height: 40),
              _buildEmailValidateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      child: Text(
        "Email\nValidate",
        style: Theme.of(context).textTheme.headline2,
      ),
      alignment: Alignment.bottomLeft,
    );
  }

  Widget _buildEmailValidateButton() {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: kLoginButtonButtonStyle,
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (_) => ResetPasswordScreen());
          Navigator.pushReplacement(context, route);
        },
        child: Text(
          "Verify",
          style: kLoginButtonContentTextStyle,
        ),
      ),
    );
  }

  Widget _buildReSend() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "If you didn't receive a code! ",
            style: tsRichTextStyle(kBodyTextColor),
          ),
          TextSpan(
            text: 'Resend',
            style:
                tsRichTextStyle(_g == true ? kLoginButtonColor : kBorderColor),
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
  }

  _buildSubTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Enter the verification code\nwe just send your email address.",
        style: kSubTitleTextStyle,
        textAlign: TextAlign.start,
      ),
    );
  }

  void startTimer() {
    if (_timerStart) {
      _timerStart = false;
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
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
      padding: EdgeInsets.fromLTRB(14, 0, 15, 0),
      decoration: kBoxDecorationTextField,
      child: VerificationCode(
        fillColor: kTextFieldColor,
        textStyle: kHintTextStyle,
        keyboardType: TextInputType.number,
        underlineColor: kBorderColor,
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
      (_start / 60).truncate().toString() +
          ":" +
          (_start % 60).toString().padLeft(2, '0').toString(),
      style: kSubTitleTextStyle,
    );
  }
}
