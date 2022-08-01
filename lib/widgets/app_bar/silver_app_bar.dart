import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';

buildSilverApp(header, title) {
 return SliverAppBar(
   systemOverlayStyle: SystemUiOverlayStyle(
     statusBarColor: Colors.transparent,
     statusBarIconBrightness: Brightness.light,
   ),
   pinned: true,
   snap: false,
   floating: false,
   shadowColor: Colors.transparent,
   backgroundColor: kAppbarColor,
   toolbarHeight: 55,
   expandedHeight: 275.0,
   leadingWidth: 200,
   leading: Container(
     margin: const EdgeInsets.fromLTRB(25, 0, 0, 0),
     child: buildTitle(title),
   ),
   flexibleSpace: header,
 );
}

Widget buildTitle(String title) {
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