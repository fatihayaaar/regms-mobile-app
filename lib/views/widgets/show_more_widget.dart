import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';

class ShowMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_drop_down_rounded,
          color: kTextFieldLightColor,
        ),
        Text(
          "Show More",
          style: kShowMoreTextStyle,
        ),
      ],
    );
  }
}