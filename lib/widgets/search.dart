import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/images.dart';
import 'package:regms_flutter_client/constants/styles.dart';

Widget buildSearch() {
  return Container(
    height: 35,
    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
    decoration: kBoxDecorationSearchTextField,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 0),
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: kListTextStyle,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: searchBTN,
          ),
        ),
      ],
    ),
  );
}
