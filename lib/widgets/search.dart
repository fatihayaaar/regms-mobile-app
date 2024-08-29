import 'package:flutter/material.dart';

import '../constants/styles.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      decoration: kBoxDecorationSearchTextField,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 0),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
              child: const Icon(Icons.search_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
