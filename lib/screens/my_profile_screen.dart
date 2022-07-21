import 'package:flutter/material.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreen createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavBar(
        selected: -2
      ),
    );
  }
}