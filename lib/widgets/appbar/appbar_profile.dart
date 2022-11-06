import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ProfileAppBar({
    super.key,
    this.title = "",
  });

  @override
  Size get preferredSize => const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 45,
      title: _buildTitle(context, title),
    );
  }

  _buildTitle(context, String title) {
    return Row(
      children: [
        Flexible(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(title),
          ),
        ),
      ],
    );
  }
}
