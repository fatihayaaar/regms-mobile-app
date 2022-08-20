import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  AppBarWidget({this.title = ""});

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState(title);

  @override
  Size get preferredSize => const Size.fromHeight(40.0);
}

class _AppBarWidgetState extends State {
  String title;

  _AppBarWidgetState(this.title);

  @override
  Widget build(BuildContext context) {
    return appBar(title);
  }

  AppBar appBar(String title) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: 40,
      title: Row(children: [
        _buildBackArrow(),
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
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Text(
          title,
          style: tAppbarTitleTextStyle,
        ),
      ),
    );
  }

  _buildBackArrow() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}