import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/views/widgets/appbar/appbar_settings.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State {
  bool? switchListTileValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettings(title: "Notification"),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
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
