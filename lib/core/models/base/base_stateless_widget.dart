import 'package:flutter/cupertino.dart';
import 'package:regms_flutter_client/core/mixins/screen_mixin.dart';

abstract class BaseStatelessWidget extends StatelessWidget with ScreenMixin {
  onModelReady(viewModel) {
    this.viewModel = viewModel;
  }

  initialState(theme, translate) {
    this.theme = theme;
    this.translate = translate;
  }
}
