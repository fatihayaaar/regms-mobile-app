import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/base/base_stateless_widget.dart';
import '../../../../core/models/base/base_view.dart';
import '../viewmodel/register_view_model.dart';
import '../../../../constants/styles.dart';
import '../../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../../../../widgets/appbar/appbar_transparent.dart';
import '../../../../widgets/shake.dart';
import '../../../../widgets/tiles/slide_tile.dart';

class RegisterScreen extends BaseStatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  late String _username;
  late String _password;
  bool _isHiddenPassword = true;

  var items = [
    'Gender',
    'Male',
    'Female',
  ];

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<RegisterViewModel>.value(
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

  PreferredSizeWidget? _buildAppBar() => AppBarTransparent();

  Widget _buildBody() => NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: _builderStepper(),
      );

  Widget _builderStepper() => Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  //_buildTopBar(),
                  const SizedBox(height: 10),
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

  Widget _buildRegisterContent() => Form(
        key: _formKey,
        child: Consumer<RegisterViewModel>(
          builder: (context, value, child) {
            return ExpandablePageView(
              controller: value.controller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                value.slideIndex = index;
              },
              children: <Widget>[
                SlideTile(widget: _buildStep1()),
                SlideTile(widget: _buildStep2()),
              ],
            );
          },
        ),
      );

  Widget _buildRegisterButton() => Consumer<RegisterViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.slideIndex != 2 && value.slideIndex != 0) {
            return child!;
          }
          return Container();
        },
        child: Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: SizedBox(
            height: 38,
            width: 120,
            child: Consumer<RegisterViewModel>(
              builder: (context, value, child) {
                return ElevatedButton(
                  style: kRegisterButtonButtonStyle,
                  onPressed: () {
                    value.registerButtonOnClick();
                  },
                  child: Text(
                    "Register",
                    style: kLoginButtonContentTextStyle,
                  ),
                );
              },
            ),
          ),
        ),
      );

  Widget _buildStep1() => Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        margin: const EdgeInsets.fromLTRB(25, 0, 25, 20),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Start\nRegistering",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 40),
            _buildUsernameTextField(),
            AspectRatio(
              aspectRatio: 10 / 2,
              child: Container(
                width: double.infinity,
              ),
            ),
            _buildContractText(),
            const SizedBox(height: 60),
            _buildNextButtonStep1(),
            const SizedBox(height: 40),
            _buildSignInText(),
          ],
        ),
      );

  Widget _buildStep2() => Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        margin: const EdgeInsets.fromLTRB(25, 0, 25, 20),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            Text(
              "Complete The Registration",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 40),
            _buildEmailTextField(),
            const SizedBox(height: 20),
            _buildPasswordTextField(),
            const SizedBox(height: 20),
            _buildDatePickerTextField(),
            const SizedBox(height: 20),
            _buildSexTextField(),
          ],
        ),
      );

  Widget _buildNextButtonStep1() => Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: SizedBox(
          height: 38,
          width: 90,
          child: Consumer<RegisterViewModel>(
            builder: (context, value, child) {
              return ElevatedButton(
                style: kRegisterButtonButtonStyle,
                onPressed: () {
                  value.nextButtonStep1OnClick();
                },
                child: Text(
                  "Go On",
                  style: kLoginButtonContentTextStyle,
                ),
              );
            },
          ),
        ),
      );

  Widget _buildUsernameTextField() => Container(
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
            } else {
              return null;
            }
          },
          decoration: tTextFieldInputDecoration("Username"),
        ),
      );

  Widget _buildContractText() => Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'By signing up for the application, you accept the ',
                style: tsRichTextStyle(ColorSchemeLight.kRegisterRichTextAboutColor),
              ),
              TextSpan(
                text: 'Confidentiality Agreement ',
                style: tsRichTextStyle(Colors.black),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(
                text: 'and ',
                style: tsRichTextStyle(ColorSchemeLight.kRegisterRichTextAboutColor),
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

  Widget _buildSignInText() => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Do you already have an account? ',
              style: tsRichTextStyle(ColorSchemeLight.kRegisterRichTextAboutColor),
            ),
            TextSpan(
              text: 'Login',
              style: tsRichTextStyle(ColorSchemeLight.kLoginButtonColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },
            ),
          ],
        ),
      );

  Widget _buildEmailTextField() => Container(
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
            } else {
              return null;
            }
          },
          decoration: tTextFieldInputDecoration("Email Address"),
        ),
      );

  Widget _buildPasswordTextField() => Container(
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
            } else {
              return null;
            }
          },
          decoration: tTextFieldInputDecoration("Password"),
        ),
      );

  Widget _buildDatePickerTextField() => Shake(
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
              margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Consumer<RegisterViewModel>(
                builder: (context, value, child) {
                  return Text(
                    value.selectedDateTime == null ? "Birth Date" : "${value.selectedDateTime}".split(' ')[0],
                    style: kHintTextStyle,
                  );
                },
              ),
            ),
          ),
        ),
      );

  Future<dynamic> _buildCupertinoDatePicker(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: Consumer<RegisterViewModel>(
            builder: (context, value, child) {
              return CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (picked) {
                  if (picked != value.selectedDateTime) {
                    value.selectedDateTime = picked;
                  }
                },
                initialDateTime: value.selectedDateTime,
                minimumYear: 1950,
                maximumYear: 2023,
              );
            },
          ),
        );
      });

  Widget _buildSexTextField() => Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: kBoxDecorationDropDownButton,
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Consumer<RegisterViewModel>(
            builder: (context, viewModel, child) {
              return DropdownButton(
                value: viewModel.selectedGender,
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (value) {
                  viewModel.selectedGender = value!;
                },
                isExpanded: true,
                underline: Container(),
                style: kHintTextStyle,
                elevation: 1,
              );
            },
          ),
        ),
      );
}
