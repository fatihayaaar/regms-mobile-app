import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../../product/extensions/context_extension.dart';
import '../../../product/network/network_manager.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get theme => context.theme;
  Function(String) get translate => context.translate;
  NetworkManager get networkManager => context.networkManager;
}
