import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';

class ShowMore extends StatelessWidget {
  final text;

  ShowMore({this.text = "Show More"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_drop_down_rounded,
          color: kTextFieldLightColor,
        ),
        Text(
          text,
          style: kShowMoreTextStyle,
        ),
      ],
    );
  }
}