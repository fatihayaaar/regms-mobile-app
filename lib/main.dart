import 'package:flutter/material.dart';
import 'package:regms_flutter_client/core/flavor/config.dart';

import 'my_app.dart';

void main() async {
  Config.appFlavor = Flavor.release;

  WidgetsFlutterBinding.ensureInitialized();
  init();
}
