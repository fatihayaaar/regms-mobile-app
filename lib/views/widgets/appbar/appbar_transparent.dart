import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/views/widgets/bottom_sheet.dart';

class AppBarTransparent extends StatelessWidget implements PreferredSizeWidget {
  final isBackArrow;
  final isAction;
  var height = 0.0;
  var statusBarIconBrightness;
  var systemNavigationBarColor;

  AppBarTransparent({
    this.isBackArrow = false,
    this.isAction = false,
    this.statusBarIconBrightness = Brightness.dark,
    this.systemNavigationBarColor = Colors.white,
  }) {
    height = this.isBackArrow ? 45 : 0.0;
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarColor: systemNavigationBarColor,
      ),
      toolbarHeight: height,
      title: Row(
        children: [
          Flexible(child: Container()),
          _buildAction(context),
        ],
      ),
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: kTextContentColor,
      ),
      shadowColor: Color.fromRGBO(0, 0, 0, 0),
    );
  }

  _buildAction(context) {
    return Visibility(
      visible: this.isAction,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            context: context,
            builder: (_) => BottomSheetWidget(),
          );
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Icon(
            Icons.keyboard_control_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
