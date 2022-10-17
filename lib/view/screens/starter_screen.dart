import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/view_models/starter_view_model.dart';
import 'package:regms_flutter_client/view/widgets/appbar/appbar_transparent.dart';

class StarterScreen extends StatefulWidget {
  static const routeName = '/starter';

  @override
  _StarterScreenState createState() => _StarterScreenState();
}

class _StarterScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return StarterViewModel();
      },
      child: Scaffold(
        appBar: AppBarTransparent(),
        body: Stack(
          children: [],
        ),
      ),
    );
  }
}
