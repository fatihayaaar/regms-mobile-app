import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  Widget widget;

  SlideTile({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      alignment: Alignment.center,
      child: widget,
    );
  }
}