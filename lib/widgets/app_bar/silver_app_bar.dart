import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
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
    toolbarHeight: 40,
    expandedHeight: 300.0,
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
        decoration: BoxDecoration(
          color: kThemeColor,
          border: Border.symmetric(
            horizontal: BorderSide(color: kBorderColor, width: 0.5),
          ),
        ),
        child: TabBar(
          indicatorColor: kAppbarColor,
          padding: EdgeInsets.zero,
          tabs: [
            _buildPostsHeaderItem(icon: Icons.format_list_bulleted_sharp),
            _buildPostsHeaderItem(icon: Icons.play_circle_outlined),
            _buildPostsHeaderItem(icon: Icons.favorite_border),
            _buildPostsHeaderItem(icon: Icons.bookmark_outline),
          ],
        ),
      ),
    ),
  );
}

_buildPostsHeaderItem({required IconData icon}) {
  return Icon(
    icon,
    size: 30,
    color: kAppbarColor,
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
