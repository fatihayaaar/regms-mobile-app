import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';

final kBasicButtonButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kBasicButtonColor),
  shadowColor: MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 0)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
  ),
);

final kButtonContentTextStyle = TextStyle(
  fontFamily: "SofiaProBold",
  fontSize: 16,
  color: kButtonContentTextColor,
);