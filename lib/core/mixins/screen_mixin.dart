import 'package:flutter/material.dart';
import 'package:regms_flutter_client/core/models/base/base_view_model.dart';
import 'package:regms_flutter_client/product/network/network_manager.dart';

mixin ScreenMixin {
  late BuildContext context;
  late ThemeData theme;
  late NetworkManager networkManager;
  late Function(String) translate;
  late BaseViewModel viewModel;
}
