import 'package:flutter/material.dart';

import '../constants/styles.dart';

class SelectionWidget extends StatelessWidget {
  final list;

  SelectionWidget({required this.list});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return Container(
      height: 27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildListTypeItem(list[index]);
        },
      ),
    );
  }

  _buildListTypeItem(value) {
    return Container(
      width: 80,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      decoration: kBoxDecorationListTypeItem,
      alignment: Alignment.center,
      child: Text(value, style: kListTypeItemTextStyle),
    );
  }
}
