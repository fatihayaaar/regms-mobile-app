import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/styles.dart';
import '../../product/theme/theme_mode/light/color_scheme_light.dart';

class AppBarSettings extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarSettings({
    super.key,
    this.title = "",
  });

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return _appBar(title, context);
  }

  _appBar(String title, context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      title: _buildTitle(context),
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      shadowColor: const Color.fromRGBO(0, 0, 0, 0),
    );
  }

  _buildTitle(context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
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
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: ColorSchemeLight.kThemeColor,
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
