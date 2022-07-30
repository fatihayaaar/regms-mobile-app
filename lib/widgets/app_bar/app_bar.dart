import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';

AppBar appBar(String title) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ),
    automaticallyImplyLeading: false,
    toolbarHeight: 55,
    title: Row(children: [
      _buildTitle(title),
      Flexible(child: Container()),
    ]),
    backgroundColor: kMainAppbarColor,
    iconTheme: IconThemeData(color: kThemeColor),
    shadowColor: Color.fromRGBO(0, 0, 0, 0),
  );
}

Widget _buildTitle(String title) {
  return Flexible(
    child: Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: tAppbarTitleTextStyle,
      ),
    ),
  );
}
