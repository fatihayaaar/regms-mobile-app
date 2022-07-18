import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';

AppBar miniAppBar({required Color color}) {
  return AppBar(
    toolbarHeight: 0,
    backgroundColor: color,
    iconTheme: IconThemeData(
      color: kTextContentColor,
    ),
    shadowColor: Color.fromRGBO(0, 0, 0, 0),
  );
}