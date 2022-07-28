import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/app_bar/title_appbar.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreen createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State {
  int _length = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar(
        "Edit Profile",
        backToTap: () {
          Navigator.pop(context);
        },
        onTap: () {},
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: kThemeColor,
      width: double.infinity,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: kAppbarColor,
          ),
          child: Column(
            children: [
              SizedBox(height: 15),
              _buildAvatarEdit(),
              SizedBox(height: 40),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              color: kAppbarColor,
              height: 30,
              width: double.infinity,
            ),
            _buildForm(),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatarEdit() {
    return Container(
      width: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: buildAvatar(
              borderColor: Colors.white.withOpacity(0),
              img: "assets/images/dump_1.jpg",
              size: 80,
            ),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBackgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: _buildFormContent(),
        ),
      ),
    );
  }

  Widget _buildFormContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          _buildProfileProperty(),
          SizedBox(height: 25),
          _buildNameAndSurnameTextField(),
          SizedBox(height: 20),
          _buildBioTextField(),
          SizedBox(height: 7),
          _buildBioLength(),
        ],
      ),
    );
  }

  Widget _buildNameAndSurnameTextField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: Text(
            "Name And Surname",
            style: kHintTextStyle,
          ),
        ),
        Container(
          decoration: tTextFieldBoxDecoration,
          child: TextFormField(
            //focusNode: _usernameFocus,
            textInputAction: TextInputAction.go,
            maxLines: 1,
            //controller: _usernameController,
            onFieldSubmitted: (term) {
              //_fieldFocusChange(context, _usernameFocus, _passwordFocus);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "* Required";
              } else
                return null;
            },
            decoration: tTextFieldInputDecoration("Name And Surname"),
          ),
        ),
      ],
    );
  }

  Widget _buildBioTextField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: Text(
            "About Me",
            style: kHintTextStyle,
          ),
        ),
        Container(
          decoration: tTextFieldBoxDecoration,
          child: TextFormField(
            //focusNode: _usernameFocus,
            textInputAction: TextInputAction.go,
            minLines: 5,
            maxLines: 10,
            onChanged: (value) {
              setState(() {
                _length = value.length;
              });
            },
            //controller: _usernameController,
            onFieldSubmitted: (term) {
              //_fieldFocusChange(context, _usernameFocus, _passwordFocus);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "* Required";
              } else
                return null;
            },
            decoration: tTextFieldInputDecoration(
                "You should write your biography! People may have opinions about you."),
          ),
        ),
      ],
    );
  }

  Widget _buildBioLength() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        "$_length/300",
        style: kHintTextStyle,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildProfileProperty() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfilePropertyChild(),
        _buildProfilePropertyChild(),
        _buildProfilePropertyChild(),
        _buildProfilePropertyChild(),
      ],
    );
  }

  _buildProfilePropertyChild() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.grey,
      ),
    );
  }
}
