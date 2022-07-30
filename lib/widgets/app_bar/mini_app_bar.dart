import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';

AppBar miniAppBar() {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    toolbarHeight: 0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: kTextContentColor,
    ),
    shadowColor: Color.fromRGBO(0, 0, 0, 0),
  );
}