import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool backButtonVisibility;

  AppBarWidget({this.title = "", this.backButtonVisibility = true});

  @override
  _AppBarWidgetState createState() =>
      _AppBarWidgetState(title, backButtonVisibility);

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _AppBarWidgetState extends State {
  String title;
  final bool backButtonVisibility;

  _AppBarWidgetState(this.title, this.backButtonVisibility);

  @override
  Widget build(BuildContext context) {
    return _appBar(title);
  }

  _appBar(String title) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      title: Row(
        children: [
          _buildBackArrow(),
          _buildTitle(title),
          Flexible(child: Container()),
        ],
      ),
      backgroundColor: kMainAppbarColor,
      iconTheme: IconThemeData(color: kThemeColor),
      shadowColor: Color.fromRGBO(0, 0, 0, 0),
    );
  }

  _buildTitle(String title) {
    return Flexible(
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Text(
          title,
          style: tAppbarTitleTextStyle,
        ),
      ),
    );
  }

  _buildBackArrow() {
    return Visibility(
      visible: backButtonVisibility,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Align(
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
        ),
      ),
    );
  }
}
