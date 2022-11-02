import 'package:flutter/material.dart';

import '../models/base/base_view_model.dart';
import '../../product/network/network_manager.dart';

mixin ScreenMixin {
  late BuildContext context;
  late ThemeData theme;
  late NetworkManager networkManager;
  late Function(String) translate;
  late BaseViewModel viewModel;
}
