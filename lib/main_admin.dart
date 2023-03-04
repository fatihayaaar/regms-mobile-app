import 'package:flutter/material.dart';

import 'core/flavor/config.dart';
import 'my_app.dart';

void main() async {
  Config.appFlavor = Flavor.admin;

  WidgetsFlutterBinding.ensureInitialized();
  init();
}
