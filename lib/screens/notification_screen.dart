import 'package:flutter/material.dart';
import 'package:regms_flutter_client/widgets/app_bar/mini_app_bar.dart';
import 'package:regms_flutter_client/widgets/settings_drawer.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miniAppBar(),
      body: _build(),
    );
  }

  Widget _build() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          buildDrawerHeader(context: context, title: "Notifications"),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
