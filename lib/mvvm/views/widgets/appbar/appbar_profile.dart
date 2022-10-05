import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final title;

  ProfileAppBar({this.title = ""});

  @override
  Size get preferredSize => const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      shadowColor: Colors.transparent,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      toolbarHeight: 45,
      title: _buildTitle(context, title),
    );
  }

  _buildTitle(context, String title) {
    return Row(
      children: [
        Flexible(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
