import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../viewmodel/splash_model_view.dart';

class Splash extends BaseStatelessWidget {
  Splash({super.key});

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
              body: _buildBody(),
            );
          },
        );
      },
    );
  }

  _buildBody() => SafeArea(
        child: Container(
          color: theme.backgroundColor,
          child: Center(
            child: _buildLogo(),
          ),
        ),
      );

  _buildLogo() => const CircularProgressIndicator();
}
