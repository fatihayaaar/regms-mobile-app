import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
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
          SlideTile(
            widget: _buildStep1(),
          ),
          SlideTile(
            widget: _buildStep2(),
          ),
          SlideTile(
            widget: _buildStep3(),
          ),
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
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
      child: Column(
        children: <Widget>[],
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
}
