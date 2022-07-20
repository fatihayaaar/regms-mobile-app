import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';

final tLoginTitleTextStyle = TextStyle(
  color: kLoginTitleColor,
  fontWeight: FontWeight.bold,
  fontSize: 50,
);

final tRegisterTitleTextStyle = TextStyle(
  color: kLoginTitleColor,
  fontWeight: FontWeight.bold,
  fontSize: 35,
);

final kLoginButtonButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kLoginButtonColor),
  shadowColor: MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);

final kRegisterButtonButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kLoginButtonColor),
  shadowColor: MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  ),
);

final kDatePickerButtonButtonStyle = ButtonStyle(
  backgroundColor:
      MaterialStateProperty.all(Color.fromRGBO(245, 245, 245, 1.0)),
  shadowColor: MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);

final kLoginButtonContentTextStyle = TextStyle(
  fontSize: 16,
  color: kButtonContentTextColor,
);

final tTextFieldBoxDecoration = BoxDecoration(
  color: Color.fromRGBO(245, 245, 245, 1.0),
  borderRadius: BorderRadius.all(Radius.circular(15)),
);

final tTextFieldInputDecoration = (hintText) => InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: kHintTextStyle,
    );

final kHintTextStyle = TextStyle(
  fontSize: 15,
  color: kTextFieldLightColor,
);

final tsRichTextStyle = (color) => TextStyle(
      height: 1.4,
      fontFamily: "SofiaPro",
      fontSize: 14,
      color: color,
    );

final tForgotPasswordTextStyle = TextStyle(
  height: 1.4,
  fontSize: 14,
  color: kLoginButtonColor,
);

final Decoration kBoxDecorationTextField = BoxDecoration(
  color: Color.fromRGBO(245, 245, 245, 1.0),
  borderRadius: BorderRadius.circular(15),
);

final gSheetActionTextStyle = TextStyle(
  fontSize: 15,
  fontFamily: "SofiaPro",
  color: Color.fromRGBO(88, 80, 49, 1),
);
