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

final kTransparentButtonButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
  backgroundColor: MaterialStateProperty.all(Color.fromRGBO(0, 0, 0, 0)),
  shadowColor: MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
    ),
  ),
);

final kProfileButtonButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kTextFieldColor),
  shadowColor: MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);

final kProfileHeaderDecoration = BoxDecoration(
  color: Colors.grey,
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(15),
    bottom: Radius.circular(0),
  ),
);

final kCommentBoxDecoration = BoxDecoration(
  color: kTextFieldColor,
  borderRadius: BorderRadius.only(
    topLeft: Radius.zero,
    topRight: Radius.circular(12),
    bottomLeft: Radius.circular(12),
    bottomRight: Radius.circular(12),
  ),
);

final kLoginButtonContentTextStyle = GoogleFonts.raleway(
  fontSize: 17,
  fontWeight: FontWeight.bold,
  color: kButtonContentTextColor,
);

final kProfileButtonContentTextStyle = GoogleFonts.raleway(
  fontSize: 13,
  fontWeight: FontWeight.bold,
  color: kAppbarColor,
);

final tTextFieldBoxDecoration = BoxDecoration(
  color: Color.fromRGBO(245, 245, 245, 1.0),
  borderRadius: BorderRadius.all(Radius.circular(15)),
);

final kCommentTextFieldBoxDecoration = BoxDecoration(
  color: Color.fromRGBO(245, 245, 245, 1.0),
  borderRadius: BorderRadius.all(Radius.circular(0)),
);

final tTextFieldInputDecoration = (hintText) => InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: kHintTextStyle,
    );

final kCommentTextFieldInputDecoration = (hintText) => InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      hintText: hintText,
      hintStyle: kHintTextStyle,
    );

final kTimeTextStyle = GoogleFonts.roboto(
  fontSize: 13,
  color: kTextFieldLightColor,
);

final kCommentTimeTextStyle = GoogleFonts.roboto(
  fontSize: 13,
  color: kTextFieldLightColor,
);

final kHintTextStyle = GoogleFonts.raleway(
  fontSize: 14,
  color: kTextFieldLightColor,
);

final kBioTextStyle = GoogleFonts.rubik(
  fontSize: 14,
  color: kTextBioColor,
);

final kSubTitleTextStyle = GoogleFonts.raleway(
  fontSize: 18,
  color: kTextFieldLightColor,
);

final tsRichTextStyle = (color) => GoogleFonts.raleway(
      height: 1.4,
      fontSize: 13,
      color: color,
    );

final kCommentRichTextStyle = (color, weight) => GoogleFonts.rubik(
      fontSize: 13,
      color: color,
      fontWeight: weight,
    );

final kLikeRichTextStyle = (color, weight) => GoogleFonts.rubik(
      height: 1.4,
      fontSize: 11,
      color: color,
      fontWeight: weight,
    );

final kActionRichTextStyle = (color, weight) => GoogleFonts.rubik(
      fontSize: 13,
      color: color,
      fontWeight: weight,
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

final gSheetActionTextStyle = GoogleFonts.rubik(
  fontSize: 14,
  color: Color.fromRGBO(88, 80, 49, 1),
);

final tAppbarTitleTextStyle = GoogleFonts.raleway(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 19,
);

final tAppbarActionTextStyle = GoogleFonts.raleway(
  color: Colors.white,
  fontSize: 19,
);

final kNameAndSurnameTextStyle = TextStyle(
  fontSize: 27,
  fontWeight: FontWeight.bold,
  color: kUsernameColor,
);

final kUsernameTextStyle = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w400,
  color: kNameAndSurnameColor,
);

final kFollowersCountTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: kRegisterRichTextAboutColor,
);

final kFollowersCountSizeTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: kAppbarColor,
);

final kListTextStyle = GoogleFonts.raleway(
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

final Decoration kBoxDecorationSearchTextField = BoxDecoration(
  color: kBorderColor,
  borderRadius: BorderRadius.circular(10),
);

final kListTitleTextStyle = GoogleFonts.raleway(
  color: kAppbarColor,
  fontWeight: FontWeight.bold,
  fontSize: 19,
);

final kPostUsernameTextStyle = GoogleFonts.rubik(
  color: kAppbarColor,
  fontWeight: FontWeight.w600,
  fontSize: 17,
);

final kPostContentTextStyle = GoogleFonts.rubik(
  color: kAppbarColor,
  fontWeight: FontWeight.w400,
  fontSize: 14,
);
