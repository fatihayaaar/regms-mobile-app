import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';

class DrawerListItem extends StatelessWidget {
  final text;
  final page;

  DrawerListItem({required this.text, required this.page});

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
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: kBodyTextColor,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
