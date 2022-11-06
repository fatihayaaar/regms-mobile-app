// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../product/theme/theme_mode/light/color_scheme_light.dart';

final kLoginButtonButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(ColorSchemeLight.kLoginButtonColor),
  shadowColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);

final kRegisterButtonButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(ColorSchemeLight.kLoginButtonColor),
  shadowColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  ),
);

final kDatePickerButtonButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1.0)),
  shadowColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      side: const BorderSide(
        width: 1,
        color: ColorSchemeLight.kBorderColor,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);

final kTransparentButtonButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(0, 0, 0, 0)),
  shadowColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
    ),
  ),
);

final kProfileButtonButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(ColorSchemeLight.kTextFieldColor),
  shadowColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);

const kProfileHeaderDecoration = BoxDecoration(
  color: Colors.grey,
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(15),
    bottom: Radius.circular(0),
  ),
);

const kCommentBoxDecoration = BoxDecoration(
  color: ColorSchemeLight.kTextFieldColor,
  borderRadius: BorderRadius.only(
    topLeft: Radius.zero,
    topRight: Radius.circular(12),
    bottomLeft: Radius.circular(12),
    bottomRight: Radius.circular(12),
  ),
);

const tTextFieldBoxDecoration = BoxDecoration(
  color: Color.fromRGBO(245, 245, 245, 1.0),
  borderRadius: BorderRadius.all(Radius.circular(15)),
);

const kCommentTextFieldBoxDecoration = BoxDecoration(
  color: Color.fromRGBO(245, 245, 245, 1.0),
  borderRadius: BorderRadius.all(Radius.circular(0)),
);

final tTextFieldInputDecoration = (hintText) => InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: kHintTextStyle,
    );

final kCommentTextFieldInputDecoration = (hintText) => InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorSchemeLight.kBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      hintText: hintText,
      hintStyle: kHintTextStyle,
    );

final kHintTextStyle = GoogleFonts.raleway(
  fontSize: 14,
  color: ColorSchemeLight.kTextFieldLightColor,
);
final Decoration kBoxDecorationTextField = BoxDecoration(
  color: const Color.fromRGBO(245, 245, 245, 1.0),
  borderRadius: BorderRadius.circular(15),
);

final Decoration kAddPostDraftBoxDecorationTextField = BoxDecoration(
  color: const Color.fromRGBO(245, 245, 245, 1.0),
  borderRadius: BorderRadius.circular(0),
);

final Decoration kAddPostBoxDecorationTextField = BoxDecoration(
  color: ColorSchemeLight.kThemeColor,
  borderRadius: BorderRadius.circular(0),
);

final Decoration kFilterBoxDecorationTextField = BoxDecoration(
  color: const Color.fromRGBO(255, 255, 255, 1.0),
  borderRadius: BorderRadius.circular(15),
  border: Border.all(color: ColorSchemeLight.kBorderColor.withOpacity(0.5)),
);

final kAddPostItemBoxDecorationTextField = BoxDecoration(
  color: const Color.fromRGBO(254, 254, 254, 1.0),
  borderRadius: BorderRadius.circular(0),
  border: Border.all(color: Colors.white.withOpacity(0.0)),
);

final Decoration kBoxDecorationDropDownButton = BoxDecoration(
  color: const Color.fromRGBO(255, 255, 255, 1.0),
  border: Border.all(color: ColorSchemeLight.kBorderColor),
  borderRadius: BorderRadius.circular(15),
);

final Decoration kBoxDecorationSearchTextField = BoxDecoration(
  color: ColorSchemeLight.kBorderColor,
  borderRadius: BorderRadius.circular(10),
);

final Decoration kBoxDecorationListTypeItem = BoxDecoration(
  color: const Color.fromRGBO(245, 245, 245, 1.0),
  borderRadius: BorderRadius.circular(10),
);

//--------------------STYLES--------------------------------------

final kLoginButtonContentTextStyle = GoogleFonts.raleway(
  fontSize: 17,
  fontWeight: FontWeight.bold,
  color: ColorSchemeLight.kButtonContentTextColor,
);

final kProfileButtonContentTextStyle = GoogleFonts.raleway(
  fontSize: 13,
  fontWeight: FontWeight.bold,
  color: ColorSchemeLight.kThemeColor,
);

final kTimeTextStyle = GoogleFonts.rubik(
  fontSize: 13,
  color: ColorSchemeLight.kTextFieldLightColor,
);

final kCommentTimeTextStyle = GoogleFonts.rubik(
  fontSize: 13,
  color: ColorSchemeLight.kTextFieldLightColor,
);

final kLabelTextStyle = GoogleFonts.rubik(
  fontSize: 14,
  color: ColorSchemeLight.kTextBioColor,
);

final kSubTitleTextStyle = GoogleFonts.raleway(
  fontSize: 18,
  color: ColorSchemeLight.kTextFieldLightColor,
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
      fontSize: 12,
      color: color,
      fontWeight: weight,
    );

final tForgotPasswordTextStyle = GoogleFonts.raleway(
  height: 1.4,
  fontSize: 13,
  color: ColorSchemeLight.kLoginButtonColor,
);

final gSheetActionTextStyle = GoogleFonts.rubik(
  fontSize: 14,
  color: const Color.fromRGBO(88, 80, 49, 1),
);

final tAppbarActionTextStyle = GoogleFonts.raleway(
  color: Colors.white,
  fontSize: 19,
);

final kUsernameTextStyle = GoogleFonts.rubik(
  fontSize: 17,
  fontWeight: FontWeight.w400,
  color: ColorSchemeLight.kNameAndSurnameColor,
);

final kBottomSheetTextStyle = GoogleFonts.rubik(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: ColorSchemeLight.kBottomSheetColor,
);

final kAddPostItemsTextStyle = GoogleFonts.rubik(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: ColorSchemeLight.kBottomSheetColor,
);

final kAgendaTextStyle = GoogleFonts.rubik(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: ColorSchemeLight.kThemeColor,
);

final kAgendaDetailTextStyle = GoogleFonts.rubik(
  color: ColorSchemeLight.kThemeColor.withOpacity(0.5),
  fontWeight: FontWeight.w400,
  fontSize: 12,
);

final kFollowersCountTextStyle = GoogleFonts.rubik(
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: ColorSchemeLight.kRegisterRichTextAboutColor,
);

final kFollowersCountSizeTextStyle = GoogleFonts.rubik(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: ColorSchemeLight.kThemeColor,
);

final kListTitleTextStyle = GoogleFonts.raleway(
  color: ColorSchemeLight.kThemeColor,
  fontWeight: FontWeight.bold,
  fontSize: 19,
);

final kPostUsernameTextStyle = GoogleFonts.rubik(
  color: ColorSchemeLight.kThemeColor,
  fontWeight: FontWeight.w600,
  fontSize: 16,
);

final kStoryMiniUsernameTextStyle = GoogleFonts.rubik(
  color: ColorSchemeLight.kThemeColor.withOpacity(0.65),
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

final kUserListUsernameTextStyle = GoogleFonts.rubik(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: ColorSchemeLight.kThemeColor,
);

final kUserListStatusTextStyle = GoogleFonts.rubik(
  color: ColorSchemeLight.kThemeColor.withOpacity(0.6),
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

final kUserListActionTextStyle = GoogleFonts.rubik(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

final kListTypeItemTextStyle = GoogleFonts.rubik(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: ColorSchemeLight.kThemeColor.withOpacity(0.8),
);

final kShowMoreTextStyle = GoogleFonts.rubik(
  fontSize: 14,
  color: ColorSchemeLight.kTextFieldLightColor,
);

final kFullScreenVideoUsernameTextStyle = GoogleFonts.rubik(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 16,
);

final kFullScreenVideoContentTextStyle = GoogleFonts.rubik(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

kUserListUsernameMessageTextStyle(onMessage) => GoogleFonts.rubik(
      fontSize: 18,
      fontWeight: onMessage ? FontWeight.w500 : FontWeight.w400,
      color: ColorSchemeLight.kThemeColor,
    );

kUserListMessageTextStyle(onMessage) => GoogleFonts.rubik(
      color: ColorSchemeLight.kThemeColor.withOpacity(0.6),
      fontWeight: onMessage ? FontWeight.w500 : FontWeight.w400,
      fontSize: 14,
    );

kTimeMessageTextStyle(onMessage) => GoogleFonts.rubik(
      fontSize: 13,
      fontWeight: onMessage ? FontWeight.w500 : FontWeight.w400,
      color: ColorSchemeLight.kTextFieldLightColor,
    );
