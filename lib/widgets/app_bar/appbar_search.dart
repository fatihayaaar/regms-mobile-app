import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/widgets/search_widget.dart';

class AppBarSearchWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AppBarSearchWidgetState createState() => _AppBarSearchWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _AppBarSearchWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return appBar();
  }

  AppBar appBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      title: Row(
        children: [
          buildSearchWidget(),
        ],
      ),
      backgroundColor: kMainAppbarColor,
      iconTheme: IconThemeData(color: kThemeColor),
      shadowColor: Color.fromRGBO(0, 0, 0, 0),
    );
  }
}
