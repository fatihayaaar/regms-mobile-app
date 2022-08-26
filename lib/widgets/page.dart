import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';

class PageWidget extends StatelessWidget {
  final Widget child;

  PageWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return Stack(
      children: [
        Container(
          height: 30,
          color: kAppbarColor,
        ),
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
          child: _buildContent(),
        ),
      ],
    );
  }

  _buildContent() {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: Container(
          color: kThemeColor,
          child: child,
        ),
      ),
    );
  }
}