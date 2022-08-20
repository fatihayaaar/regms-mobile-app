import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';

buildSearchWidget() {
  return Flexible(
    child: Container(
      height: 30,
      alignment: AlignmentDirectional(0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              child: TextFormField(
                //controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    color: kThemeColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
