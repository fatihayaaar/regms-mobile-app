import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles.dart';
import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/avatar.dart';
import '../viewmodel/edit_profile_view_model.dart';

class EditProfileScreen extends BaseStatelessWidget {

  EditProfileScreen({super.key});

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

  MyAppBar _buildAppBar() => const MyAppBar(
        title: "Edit Profile",
        backButtonVisibility: true,
        isSaveAction: true,
      );

  _buildBody() => Container(
        color: theme.canvasColor,
        width: double.infinity,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: _buildContent(),
            ),
          ),
        ),
      );

  Widget _buildContent() => Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: ColorSchemeLight.kThemeColor,
            ),
            child: Column(
              children: [
                const SizedBox(height: 15),
                _buildAvatarEdit(),
                const SizedBox(height: 40),
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

  Widget _buildAvatarEdit() => SizedBox(
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
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
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

  Widget _buildForm() => NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
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

  Widget _buildFormContent() => Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
        child: Column(
          children: [
            const SizedBox(height: 25),
            //_buildProfileProperty(),
            //SizedBox(height: 25),
            _buildNameAndSurnameTextField(),
            const SizedBox(height: 25),
            _buildBioTextField(),
            const SizedBox(height: 7),
            _buildBioLength(),
          ],
        ),
      );

  Widget _buildNameAndSurnameTextField() => Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 10),
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
                } else {
                  return null;
                }
              },
              decoration: tTextFieldInputDecoration("Name And Surname"),
            ),
          ),
        ],
      );

  Widget _buildBioTextField() => Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 10),
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
                    } else {
                      return null;
                    }
                  },
                  decoration: tTextFieldInputDecoration("You should write your biography! People may have opinions about you."),
                );
              },
            ),
          ),
        ],
      );

  Widget _buildBioLength() => Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
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

  Widget _buildProfileProperty() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildProfilePropertyChild(),
          _buildProfilePropertyChild(),
          _buildProfilePropertyChild(),
          _buildProfilePropertyChild(),
        ],
      );

  Widget _buildProfilePropertyChild() => Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.grey,
        ),
      );
}
