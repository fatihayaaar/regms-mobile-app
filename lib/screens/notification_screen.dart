import 'package:flutter/material.dart';
import 'package:regms_flutter_client/models/user_list_tile.dart';
import 'package:regms_flutter_client/widgets/app_bar/appbar_settings.dart';
import 'package:regms_flutter_client/widgets/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettings(title: "Notifications"),
      body: _build(),
    );
  }

  Widget _build() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: SingleChildScrollView(
        child: _buildNotifications(),
      ),
    );
  }

  _buildNotifications() {
    return ListView.builder(
      itemCount: 25,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return NotificationTile(
          user: UserListTile(
            username: 'deneme',
            avatar: "assets/images/dump_1.jpg",
          ),
        );
      },
    );
  }
}
