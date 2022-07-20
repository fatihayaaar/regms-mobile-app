import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:regms_flutter_client/animations/fade_animation.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/app_bar/mini_app_bar.dart';
import 'package:regms_flutter_client/widgets/slide_tile.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State {
  final _formKey = GlobalKey<FormState>();
  late PageController controller;
  int slideIndex = 0;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  late String _username;
  late String _password;
  bool _isHiddenPassword = true;

  @override
  void initState() {
    super.initState();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miniAppBar(color: Color.fromRGBO(0, 0, 0, 0)),
      body: Stack(
        children: [
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return false;
            },
            child: _builderStepper(),
          ),
        ],
      ),
    );
  }

  Widget _builderStepper() {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                //_buildTopBar(),
                SizedBox(height: 10),
                _buildRegisterContent(),
              ],
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 10,
          child: _buildNextButton(),
        )
      ],
    );
  }

  Widget _buildRegisterContent() {
    return Form(
      key: _formKey,
      child: ExpandablePageView(
        controller: controller,
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            slideIndex = index;
          });
        },
        children: <Widget>[
          SlideTile(widget: _buildStep1()),
          SlideTile(widget: _buildStep2()),
          SlideTile(widget: _buildStep3()),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    Widget widget;
    if (slideIndex != 3 && slideIndex != 0) {
      widget = Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Color.fromRGBO(0, 0, 0, 0),
        child: SizedBox(
          width: 72,
          height: 38,
          child: ElevatedButton(
            onPressed: () {
              nextButtonOnClick();
            },
            child: Container(),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(255, 170, 0, 1)),
              shadowColor:
                  MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (slideIndex == 3) {
      widget = Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        color: Color.fromRGBO(0, 0, 0, 0),
        child: SizedBox(
          width: 153,
          height: 38,
          child: ElevatedButton(
              onPressed: () {
                submitButtonOnClick();
              },
              child: Text("Kaydı Tamamla", style: kLoginButtonContentTextStyle),
              style: kLoginButtonButtonStyle),
        ),
      );
    } else {
      widget = Container();
    }
    return widget;
  }

  void nextButtonOnClick() {}

  void submitButtonOnClick() {}

  Widget _buildStep1() {
    return FadeAnimation(
      1.0,
      Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text("Register", style: tRegisterTitleTextStyle),
            SizedBox(height: 40),
            _buildUsernameTextField(),
            AspectRatio(
              aspectRatio: 10 / 4,
              child: Container(
                width: double.infinity,
              ),
            ),
            _buildContractText(),
            SizedBox(height: 10),
            _buildNextButtonStep1(),
            SizedBox(height: 40),
            _buildSignInText(),
          ],
        ),
      ),
    );
  }

  Widget _buildStep2() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      child: Column(
        children: <Widget>[],
      ),
    );
  }

  Widget _buildStep3() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      child: Column(
        children: <Widget>[],
      ),
    );
  }

  Widget _buildNextButtonStep1() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        height: 38,
        width: 72,
        child: ElevatedButton(
          style: kRegisterButtonButtonStyle,
          onPressed: () {},
          child: Container(
            child: Text(
              "Go On",
              style: kLoginButtonContentTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return Container(
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
          } else
            return null;
        },
        decoration: tTextFieldInputDecoration("Username"),
      ),
    );
  }

  Widget _buildContractText() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'By signing up for the application, you accept the ',
              style: tsRichTextStyle(kRegisterRichTextAboutColor),
            ),
            TextSpan(
              text: 'Confidentiality Agreement ',
              style: tsRichTextStyle(Colors.black),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: 'and ',
              style: tsRichTextStyle(kRegisterRichTextAboutColor),
            ),
            TextSpan(
              text: 'User Agreement.',
              style: tsRichTextStyle(Colors.black),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Do you already have an account? ',
            style: tsRichTextStyle(kRegisterRichTextAboutColor),
          ),
          TextSpan(
            text: 'Login',
            style: tsRichTextStyle(kLoginButtonColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}
