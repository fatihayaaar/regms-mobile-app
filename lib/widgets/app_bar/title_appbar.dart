import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/images.dart';
import 'package:regms_flutter_client/constants/styles.dart';

AppBar titleAppBar(String title,
    {required void backToTap(), required void onTap()}) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 55,
    title: Row(children: [
      _buildLeftAction(backToTap),
      _buildTitle(title),
      _buildRightAction(onTap),
    ]),
    backgroundColor: kAppbarColor,
    iconTheme: IconThemeData(color: kTextContentColor),
    shadowColor: Color.fromRGBO(0, 0, 0, 0),
  );
}

Widget _buildTitle(String title) {
  return Flexible(
    child: Container(
      alignment: Alignment.center,
      child: Text(
        title,
        style: tAppbarTitleTextStyle,
      ),
    ),
  );
}

Widget _buildLeftAction(uploadTap) {
  return Container(
    width: 40,
    child: ElevatedButton(
      onPressed: uploadTap,
      style: kTransparentButtonButtonStyle,
      child: whiteArrowSvg,
    ),
  );
}

Widget _buildRightAction(onTap) {
  return GestureDetector(
    child: Container(
      width: 40,
      alignment: Alignment.centerRight,
      child: Text(
        "Save",
        style: tAppbarActionTextStyle,
      ),
    ),
    onTap: onTap,
  );
}
