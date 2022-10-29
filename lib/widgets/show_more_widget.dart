import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/color_scheme_light.dart';

class ShowMore extends StatelessWidget {
  final text;

  ShowMore({this.text = "Show More"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_drop_down_rounded,
          color: ColorSchemeLight.kTextFieldLightColor,
        ),
        Text(
          text,
          style: kShowMoreTextStyle,
        ),
      ],
    );
  }
}
