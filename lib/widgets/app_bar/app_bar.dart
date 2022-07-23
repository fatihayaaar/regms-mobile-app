import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/images.dart';
import 'package:regms_flutter_client/constants/styles.dart';

AppBar appBar(String title, {required void uploadTap(), required void onTap()}) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 55,
    title: Row(children: [
      _buildTitle(title),
      Flexible(child: Container()),
      _buildRightAction(onTap),
    ]),
    backgroundColor: kMainAppbarColor,
    iconTheme: IconThemeData(color: kTextContentColor),
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

Widget _buildRightAction(onTap) {
  return GestureDetector(
    child: Container(
      width: 40,
      alignment: Alignment.centerRight,
      child: menuSvg,
    ),
    onTap: onTap,
  );
}
