import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/main.dart';
import 'package:regms_flutter_client/screens/main_screens/profile_screen.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar_transparent.dart';
import 'package:regms_flutter_client/widgets/shake.dart';
import 'package:regms_flutter_client/widgets/tiles/slide_tile.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

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

  late DateTime _dateTime = new DateTime.now();
  late String _selectedGender = "Gender";

  var items = [
    'Gender',
    'Male',
    'Female',
  ];

  @override
  void initState() {
    super.initState();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTransparent(),
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
          bottom: 30,
          child: _buildRegisterButton(),
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
        ],
      ),
    );
  }

  Widget _buildRegisterButton() {
    if (slideIndex != 2 && slideIndex != 0) {
      return Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Container(
          height: 38,
          width: 120,
          child: ElevatedButton(
            style: kRegisterButtonButtonStyle,
            onPressed: () {
              submitButtonOnClick();
            },
            child: Container(
              child: Text(
                "Register",
                style: kLoginButtonContentTextStyle,
              ),
            ),
          ),
        ),
      );
    }
    return Container();
  }

  Widget _buildStep1() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Container(
            child: Text("Start\nRegistering", style: tRegisterTitleTextStyle),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(height: 40),
          _buildUsernameTextField(),
          AspectRatio(
            aspectRatio: 10 / 2,
            child: Container(
              width: double.infinity,
            ),
          ),
          _buildContractText(),
          SizedBox(height: 60),
          _buildNextButtonStep1(),
          SizedBox(height: 40),
          _buildSignInText(),
        ],
      ),
    );
  }

  Widget _buildStep2() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Text("Complete The Registration", style: tRegisterTitleTextStyle),
          SizedBox(height: 40),
          _buildEmailTextField(),
          SizedBox(height: 20),
          _buildPasswordTextField(),
          SizedBox(height: 20),
          _buildDatePickerTextField(),
          SizedBox(height: 20),
          _buildSexTextField(),
        ],
      ),
    );
  }

  Widget _buildNextButtonStep1() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        height: 38,
        width: 90,
        child: ElevatedButton(
          style: kRegisterButtonButtonStyle,
          onPressed: () {
            nextButtonStep1OnClick();
          },
          child: Text(
            "Go On",
            style: kLoginButtonContentTextStyle,
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

  Widget _buildEmailTextField() {
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
        decoration: tTextFieldInputDecoration("Email Address"),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      decoration: tTextFieldBoxDecoration,
      child: TextFormField(
        focusNode: _passwordFocus,
        textInputAction: TextInputAction.go,
        maxLines: 1,
        obscureText: _isHiddenPassword,
        controller: _passwordController,
        onFieldSubmitted: (value) {
          _passwordFocus.unfocus();
          //_loginButtonOnClick();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "* Required";
          } else
            return null;
        },
        decoration: tTextFieldInputDecoration("Password"),
      ),
    );
  }

  Widget _buildDatePickerTextField() {
    return Shake(
      //key: _keyDateAni,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          //focusNode: _emailFocus,
          style: kDatePickerButtonButtonStyle,
          onPressed: () {
            // _datePickerShow();
            _buildCupertinoDatePicker(context);
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              _dateTime == null ? "Birth Date" : "$_dateTime".split(' ')[0],
              style: kHintTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  _buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != _dateTime)
                  setState(() {
                    _dateTime = picked;
                  });
              },
              initialDateTime: _dateTime,
              minimumYear: 1950,
              maximumYear: 2023,
            ),
          );
        });
  }

  Widget _buildSexTextField() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: kBoxDecorationDropDownButton,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: DropdownButton(
          value: _selectedGender,
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedGender = value!;
            });
          },
          isExpanded: true,
          underline: Container(),
          style: kHintTextStyle,
          elevation: 1,
        ),
      ),
    );
  }

  void nextButtonStep1OnClick() {
    FocusScope.of(context).requestFocus(FocusNode());

    controller.animateToPage(
      slideIndex + 1,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );

    setState(() {
      slideIndex = slideIndex + 1;
    });
  }

  void submitButtonOnClick() async {
    await appService.providerPersistHelper.saveToken("fayar");
    appService.providerPersistHelper.initMyUser();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(
          user: appService.providerPersistHelper.myUser!,
          isMyProfile: true,
        ),
      ),
    );
  }
}
