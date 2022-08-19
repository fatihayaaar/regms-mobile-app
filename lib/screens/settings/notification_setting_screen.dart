import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/app_bar/mini_app_bar.dart';
import 'package:regms_flutter_client/widgets/settings_drawer.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State {
  bool? switchListTileValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miniAppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          buildDrawerHeader(context: context, title: "Notification"),
          _buildNotificationItem('Messages'),
          _buildNotificationItem('Followers'),
          _buildNotificationItem('Posts'),
        ],
      ),
    );
  }

  _buildNotificationItem(String text) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SwitchListTile(
        contentPadding: EdgeInsets.all(0),
        value: switchListTileValue ??= true,
        onChanged: (newValue) => setState(() => switchListTileValue = newValue),
        title: Text(text, style: kListTextStyle),
        dense: true,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
