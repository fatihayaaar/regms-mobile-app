import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDragContainer(),
              _buildItem("Share", Icons.share_rounded),
              _buildItem("Get Link", Icons.insert_link),
              _buildItem("Edit", Icons.mode_edit),
              Divider(color: kBorderColor),
              _buildItem("Delete", Icons.delete_outline),
            ],
          ),
        ),
      ),
    );
  }

  _buildItem(String text, IconData icon) {
    return Container(
      width: double.infinity,
      height: 47,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFFF1F4F8),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Icon(
                  icon,
                  color: Color(0xFF57636C),
                  size: 15,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text, style: kBottomSheetTextStyle),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDragContainer() {
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
        child: Container(
          width: 50,
          height: 4,
          decoration: BoxDecoration(
            color: Color(0xFFF1F4F8),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
