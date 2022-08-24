import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/search_widget.dart';

class AppBarSearchWidget extends StatelessWidget implements PreferredSizeWidget {
  final searchOnChanged;

  AppBarSearchWidget({this.searchOnChanged});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return _appBar();
  }

  _appBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      title: Row(
        children: [
          _buildTitle("Search"),
          SizedBox(width: 15),
          SearchWidget(onChanged: searchOnChanged),
        ],
      ),
      backgroundColor: kMainAppbarColor,
      iconTheme: IconThemeData(color: kThemeColor),
      shadowColor: Color.fromRGBO(0, 0, 0, 0),
    );
  }

  _buildTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        title,
        style: tAppbarTitleTextStyle,
      ),
    );
  }
}
