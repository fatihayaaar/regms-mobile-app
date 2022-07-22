import 'package:flutter/material.dart';
import 'package:regms_flutter_client/animations/fade_animation.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/app_bar/mini_app_bar.dart';

class EmailValidateScreen extends StatefulWidget {
  @override
  _EmailValidateScreen createState() => _EmailValidateScreen();
}

class _EmailValidateScreen extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miniAppBar(color: Color.fromRGBO(0, 0, 0, 0)),
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          FadeAnimation(1.0, _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                _buildTitle(),
                SizedBox(height: 20),
                _buildEmailValidateButton(),
              ],
            )
        )
    );
  }

  Widget _buildTitle() {
    return Container(
      child: Text("Email\nValidate", style: tRegisterTitleTextStyle),
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
          Route route = MaterialPageRoute(builder: (_) => EmailValidateScreen());
          Navigator.pushReplacement(context, route);
        },
        child: Text(
          "Verify",
          style: kLoginButtonContentTextStyle,
        ),
      ),
    );
  }
}