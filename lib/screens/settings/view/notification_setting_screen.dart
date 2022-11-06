import 'package:flutter/material.dart';

import '../../../widgets/appbar/appbar_settings.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State {
  bool? switchListTileValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSettings(title: "Notification"),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
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
        contentPadding: const EdgeInsets.all(0),
        value: switchListTileValue ??= true,
        onChanged: (newValue) => setState(() => switchListTileValue = newValue),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        dense: true,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}