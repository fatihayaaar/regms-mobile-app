import 'package:flutter/material.dart';

import 'core/flavor/config.dart';
import 'my_app.dart';

void main() async {
  Config.appFlavor = Flavor.development;

  WidgetsFlutterBinding.ensureInitialized();
  init();
}
