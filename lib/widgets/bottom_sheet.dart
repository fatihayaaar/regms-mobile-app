import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../product/theme/theme_mode/light/color_scheme_light.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDragContainer(),
              _buildItem("Share", Icons.share_rounded),
              _buildItem("Get Link", Icons.insert_link),
              _buildItem("Edit", Icons.mode_edit),
              const Divider(color: ColorSchemeLight.kBorderColor),
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
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: const Color(0xFFF1F4F8),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: Icon(
                  icon,
                  color: const Color(0xFF57636C),
                  size: 15,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
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
        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
        child: Container(
          width: 50,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4F8),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
