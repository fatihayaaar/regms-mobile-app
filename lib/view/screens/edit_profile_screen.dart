import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/view_models/edit_profile_view_model.dart';
import 'package:regms_flutter_client/view/widgets/appbar/appbar.dart';
import 'package:regms_flutter_client/view/widgets/avatar.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = '/profile/edit';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return EditProfileViewModel();
      },
      child: Scaffold(
        appBar: MyAppBar(
          title: "Edit Profile",
          backButtonVisibility: true,
          isSaveAction: true,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      width: double.infinity,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: kThemeColor,
          ),
          child: Column(
            children: [
              SizedBox(height: 15),
              _buildAvatarEdit(context),
              SizedBox(height: 40),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              color: kThemeColor,
              height: 30,
              width: double.infinity,
            ),
            _buildForm(context),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatarEdit(context) {
    return Container(
      width: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Avatar(
              borderColor: Colors.white.withOpacity(0),
              img: "assets/images/dump_1.jpg",
              size: 80,
            ),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kBackgroundColor,
              ),
              child: Icon(
                Icons.camera_alt,
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm(context) {
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
          child: _buildFormContent(context),
        ),
      ),
    );
  }

  Widget _buildFormContent(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: Column(
        children: [
          SizedBox(height: 25),
          //_buildProfileProperty(),
          //SizedBox(height: 25),
          _buildNameAndSurnameTextField(context),
          SizedBox(height: 25),
          _buildBioTextField(context),
          SizedBox(height: 7),
          _buildBioLength(),
        ],
      ),
    );
  }

  Widget _buildNameAndSurnameTextField(context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: Text(
            "Name And Surname",
            style: Theme.of(context).textTheme.bodyText1,
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

  Widget _buildBioTextField(context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: Text(
            "About Me",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Container(
          decoration: tTextFieldBoxDecoration,
          child: Consumer<EditProfileViewModel>(
            builder: (BuildContext context, value, Widget? child) {
              return TextFormField(
                //focusNode: _usernameFocus,
                textInputAction: TextInputAction.go,
                minLines: 5,
                maxLines: 10,
                onChanged: (val) => value.textFormFieldOnChanges(val.length),
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
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBioLength() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Consumer<EditProfileViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          return Text(
            "${value.length}/300",
            style: kHintTextStyle,
            textAlign: TextAlign.left,
          );
        },
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
