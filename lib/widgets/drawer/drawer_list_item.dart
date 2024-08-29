import 'package:flutter/material.dart';

import '../../product/theme/theme_mode/light/color_scheme_light.dart';

class DrawerListItem extends StatelessWidget {
  final text;
  final page;

  const DrawerListItem({
    super.key,
    required this.text,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return _buildDrawerListItem(context, text, page);
  }

  _buildDrawerListItem(context, String text, Widget page) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(builder: (_) => page);
        Navigator.push(context, route);
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: ColorSchemeLight.kBodyTextColor,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
