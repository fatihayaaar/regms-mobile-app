import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../network/network_manager.dart';

extension NetworkManagerExtension on BuildContext {
  NetworkManager get networkManager => Provider.of<NetworkManager>(this);
}
