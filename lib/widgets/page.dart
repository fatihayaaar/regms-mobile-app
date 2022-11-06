import 'package:flutter/material.dart';

import '../product/theme/theme_mode/light/color_scheme_light.dart';

class PageWidget extends StatelessWidget {
  final Widget child;
  final bool isRadius;

  const PageWidget({
    super.key,
    required this.child,
    this.isRadius = false,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  _buildBody(context) {
    return Stack(
      children: [
        Container(
          height: 30,
          color: ColorSchemeLight.kThemeColor,
        ),
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(isRadius ? 12 : 0),
          ),
          child: _buildContent(context),
        ),
      ],
    );
  }

  _buildContent(context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: child,
        ),
      ),
    );
  }
}
