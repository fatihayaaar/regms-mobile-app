import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';

final kLoginButtonButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kLoginButtonColor),
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

final kHintTextStyle = TextStyle(
  fontSize: 14,
  color: kTextLightColor,
);