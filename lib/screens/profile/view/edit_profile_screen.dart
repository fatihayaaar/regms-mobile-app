import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles.dart';
import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../viewmodel/edit_profile_view_model.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/avatar.dart';

class EditProfileScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<EditProfileViewModel>(
      viewModel: EditProfileViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<EditProfileViewModel>.value(
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

  MyAppBar _buildAppBar() {
    return MyAppBar(
      title: "Edit Profile",
      backButtonVisibility: true,
      isSaveAction: true,
    );
  }

  _buildBody() {
    return Container(
      color: theme.backgroundColor,
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

  _buildContent() {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorSchemeLight.kThemeColor,
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
              color: ColorSchemeLight.kThemeColor,
              height: 30,
              width: double.infinity,
            ),
            _buildForm(),
          ],
        ),
      ],
    );
  }

  _buildAvatarEdit() {
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
                color: ColorSchemeLight.kBackgroundColor,
              ),
              child: Icon(
                Icons.camera_alt,
                color: theme.appBarTheme.backgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildForm() {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorSchemeLight.kBackgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: _buildFormContent(),
        ),
      ),
    );
  }

  _buildFormContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: Column(
        children: [
          SizedBox(height: 25),
          //_buildProfileProperty(),
          //SizedBox(height: 25),
          _buildNameAndSurnameTextField(),
          SizedBox(height: 25),
          _buildBioTextField(),
          SizedBox(height: 7),
          _buildBioLength(),
        ],
      ),
    );
  }

  _buildNameAndSurnameTextField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: Text(
            "Name And Surname",
            style: theme.textTheme.bodySmall,
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

  _buildBioTextField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: Text(
            "About Me",
            style: theme.textTheme.bodySmall,
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

  _buildBioLength() {
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

  _buildProfileProperty() {
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
