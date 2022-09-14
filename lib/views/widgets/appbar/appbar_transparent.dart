import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';

class AppBarTransparent extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(0.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      toolbarHeight: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: kTextContentColor,
      ),
      shadowColor: Color.fromRGBO(0, 0, 0, 0),
    );
  }
}