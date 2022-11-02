import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/core/models/base/base_stateless_widget.dart';
import 'package:regms_flutter_client/core/models/base/base_view.dart';
import 'package:regms_flutter_client/screens/splash/viewmodel/splash_model_view.dart';

class Splash extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<SplashViewModel>.value(
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

  _buildAppBar() {}

  _buildBody() {}
}
