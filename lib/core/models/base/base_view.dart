import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/core/models/base/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, dynamic child) builder;
  final T viewModel;

  BaseView({
    required this.builder,
    required this.viewModel,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => widget.viewModel,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
