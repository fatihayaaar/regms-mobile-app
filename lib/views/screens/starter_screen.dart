import 'package:flutter/material.dart';
import 'package:regms_flutter_client/views/widgets/appbar/appbar_transparent.dart';

class StarterScreen extends StatefulWidget {
  static const routeName = '/starter';

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
