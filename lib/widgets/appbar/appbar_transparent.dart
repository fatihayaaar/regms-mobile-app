import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../bottom_sheet.dart';

class AppBarTransparent extends StatelessWidget implements PreferredSizeWidget {
  final isBackArrow;
  final isAction;
  var height = 0.0;
  var statusBarIconBrightness;
  var systemNavigationBarColor;

  AppBarTransparent({
    super.key,
    this.isBackArrow = false,
    this.isAction = false,
    this.statusBarIconBrightness = Brightness.dark,
    this.systemNavigationBarColor = Colors.white,
  }) {
    height = isBackArrow ? 45 : 0.0;
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
      iconTheme: const IconThemeData(
        color: ColorSchemeLight.kTextContentColor,
      ),
      shadowColor: const Color.fromRGBO(0, 0, 0, 0),
    );
  }

  _buildAction(context) {
    return Visibility(
      visible: isAction,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            context: context,
            builder: (_) => const BottomSheetWidget(),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: const Icon(
            Icons.keyboard_control_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
