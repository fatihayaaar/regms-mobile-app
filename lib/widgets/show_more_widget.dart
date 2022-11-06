import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../product/theme/theme_mode/light/color_scheme_light.dart';

class ShowMore extends StatelessWidget {
  final String text;

  const ShowMore({
    super.key,
    this.text = "Show More",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
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
