import 'package:flutter/material.dart';

class VideoFullScreenCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: _buildContent(),
    );
  }

  _buildContent() {
    return Stack(
      children: [
        Positioned(
          bottom: 20,
          left: 20,
          child: _buildActions(),
        ),
      ],
    );
  }

  _buildActions() {
    return Row(
      children: [],
    );
  }
}
