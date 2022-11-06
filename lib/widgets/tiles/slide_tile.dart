import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  final Widget widget;

  const SlideTile({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      alignment: Alignment.center,
      child: widget,
    );
  }
}
