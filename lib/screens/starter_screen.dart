import 'package:flutter/material.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar_transparent.dart';

class StarterScreen extends StatefulWidget {
  @override
  _StarterScreenState createState() => _StarterScreenState();
}

class _StarterScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTransparent(),
      body: Stack(
        children: [

        ],
      ),
    );
  }
}
