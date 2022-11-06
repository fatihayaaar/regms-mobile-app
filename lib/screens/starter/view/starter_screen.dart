import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/appbar/appbar_transparent.dart';
import '../viewmodel/starter_view_model.dart';

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
          children: const [],
        ),
      ),
    );
  }
}
