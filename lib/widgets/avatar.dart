import 'package:flutter/material.dart';

Widget buildAvatar(
    {required Color borderColor, required String img, required double size}) {
  return Container(
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: borderColor,
    ),
    child: CircleAvatar(
      backgroundColor: Colors.grey,
      radius: size,
      backgroundImage: AssetImage(img),
    ),
  );
}
