import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';

class AppBarSettings extends StatelessWidget implements PreferredSizeWidget {
  final title;

  AppBarSettings({this.title = ""});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return _appBar(title, context);
  }

  _appBar(String title, context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      title: _buildTitle(context),
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      shadowColor: Color.fromRGBO(0, 0, 0, 0),
    );
  }

  _buildTitle(context) {
    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: kListTitleTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: kThemeColor,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
