import 'package:flutter/material.dart';

import 'base_state.dart';
import 'base_view_model.dart';
import '../../../product/network/network_manager.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model) builder;
  final T viewModel;
  final Function(T) onModelReady;
  final Function(ThemeData theme, Function(String) translate,
      NetworkManager networkManager) initialState;
  final child;

  BaseView({
    required this.builder,
    required this.viewModel,
    required this.onModelReady,
    required this.initialState,
    this.child,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends BaseState<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.setContext(context);
    widget.onModelReady(widget.viewModel);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.initialState(theme, translate, networkManager);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.viewModel);
  }
}
