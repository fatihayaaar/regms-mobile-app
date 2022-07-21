import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/images.dart';
import 'package:regms_flutter_client/constants/styles.dart';

AppBar appBar(
    {bool hideIcon = false,
    IconData icon = Icons.create,
    String action = "",
    required void uploadTap(),
    required void onTap()}) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 55,
    title: Row(children: [_buildLeftAction(uploadTap)]),
    backgroundColor: kThemeColor,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0.5),
      child: Container(
        color: kBorderColor,
        height: 0.5,
      ),
    ),
    iconTheme: IconThemeData(color: kTextContentColor),
    shadowColor: Color.fromRGBO(0, 0, 0, 0),
    actions: [
      _buildNotificationAction(onTap),
      _buildRightAction(onTap),
    ],
  );
}

Widget _buildLeftAction(uploadTap) {
  return Container(
    width: 20,
    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
    child: ElevatedButton(
      onPressed: uploadTap,
      style: kTransparentButtonButtonStyle,
      child: uploadSvg,
    ),
  );
}

Widget _buildRightAction(onTap) {
  return GestureDetector(
    child: Container(
      width: 20,
      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
      alignment: Alignment.centerRight,
      child: menuSvg,
    ),
    onTap: onTap,
  );
}

Widget _buildNotificationAction(onTap) {
  return GestureDetector(
    child: Container(
      width: 20,
      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
      alignment: Alignment.centerRight,
      child: notificationSvg,
    ),
    onTap: onTap,
  );
}
