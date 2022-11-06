import 'package:flutter/cupertino.dart';

import '../../mixins/screen_mixin.dart';

abstract class BaseStatelessWidget extends StatelessWidget with ScreenMixin {
  BaseStatelessWidget({super.key});

  onModelReady(viewModel) {
    this.viewModel = viewModel;
  }

  initialState(theme, translate, networkManager) {
    this.theme = theme;
    this.translate = translate;
    this.networkManager = networkManager;
  }
}
