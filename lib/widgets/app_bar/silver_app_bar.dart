import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/images.dart';
import 'package:regms_flutter_client/constants/styles.dart';

buildSilverApp(header, title, context) {
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
    expandedHeight: 325.0,
    leadingWidth: 400,
    leading: Container(
      margin: const EdgeInsets.fromLTRB(25, 0, 0, 0),
      child: buildTitle(title),
    ),
    flexibleSpace: header,
    bottom: PreferredSize(
      preferredSize: Size(40, 40),
      child: Container(
        height: 40,
        color: kThemeColor,
        child: TabBar(
          indicatorColor: kAppbarColor,
          padding: EdgeInsets.zero,
          tabs: [
            _buildPostsHeaderItem(svg: messages),
            _buildPostsHeaderItem(svg: search),
            _buildPostsHeaderItem(svg: heart),
          ],
        ),
      ),
    ),
  );
}

_buildPostsHeaderItem({required Widget svg}) {
  return Container(
    height: 30,
    width: 30,
    alignment: Alignment.center,
    child: svg,
  );
}

Widget buildTitle(String title) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: tAppbarTitleTextStyle,
    ),
  );
}
