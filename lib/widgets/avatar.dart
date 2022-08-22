import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final Color borderColor;
  final String img;
  final double size;
  final bool isStory;

  Avatar({
    required this.borderColor,
    required this.img,
    required this.size,
    this.isStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isStory ? Colors.red : Colors.transparent,
      ),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: size,
          backgroundImage: AssetImage(img),
        ),
      ),
    );
  }
}
