import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../widgets/appbar/appbar_transparent.dart';
import '../viewmodel/starter_view_model.dart';

class StarterScreen extends BaseStatelessWidget {

  StarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<StarterViewModel>(
      viewModel: StarterViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<StarterViewModel>.value(
          value: viewModel,
          builder: (context, child) {
            return Scaffold(
              appBar: _buildAppBar(),
              body: _buildBody(),
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBarTransparent();

  _buildBody() => const Stack(
        children: [],
      );
}
