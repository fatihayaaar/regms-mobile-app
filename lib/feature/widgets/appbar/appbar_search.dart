import 'package:flutter/material.dart';
import 'package:regms_flutter_client/feature/widgets/search_widget.dart';

class AppBarSearchWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final searchOnChanged;

  AppBarSearchWidget({this.searchOnChanged});

  @override
  Size get preferredSize => const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context) {
    return _appBar(context);
  }

  _appBar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 45,
      title: Row(
        children: [
          _buildTitle(context, "Search"),
          SizedBox(width: 15),
          SearchWidget(onChanged: searchOnChanged),
        ],
      ),
    );
  }

  _buildTitle(context, String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(title),
    );
  }
}
