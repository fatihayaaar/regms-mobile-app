import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regms_flutter_client/constants/colors.dart';

final tLoginTitleTextStyle = GoogleFonts.raleway(
  color: kLoginTitleColor,
  fontWeight: FontWeight.bold,
  fontSize: 48,
);

final tRegisterTitleTextStyle = GoogleFonts.raleway(
  color: kLoginTitleColor,
  fontWeight: FontWeight.bold,
  fontSize: 33,
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
      MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 1.0)),
  shadowColor: MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      side: BorderSide(
        width: 1,
        color: kBorderColor,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);

final kLoginButtonContentTextStyle = GoogleFonts.raleway(
  fontSize: 17,
  fontWeight: FontWeight.bold,
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

final kHintTextStyle = GoogleFonts.raleway(
  fontSize: 14,
  color: kTextFieldLightColor,
);

final tsRichTextStyle = (color) => GoogleFonts.raleway(
      height: 1.4,
      fontSize: 13,
      color: color,
    );

final tForgotPasswordTextStyle = GoogleFonts.raleway(
  height: 1.4,
  fontSize: 13,
  color: kLoginButtonColor,
);

final Decoration kBoxDecorationTextField = BoxDecoration(
  color: Color.fromRGBO(245, 245, 245, 1.0),
  borderRadius: BorderRadius.circular(15),
);

final Decoration kBoxDecorationDropDownButton = BoxDecoration(
  color: Color.fromRGBO(255, 255, 255, 1.0),
  border: Border.all(color: kBorderColor),
  borderRadius: BorderRadius.circular(15),
);

final gSheetActionTextStyle = GoogleFonts.nunitoSans(
  fontSize: 14,
  color: Color.fromRGBO(88, 80, 49, 1),
);
