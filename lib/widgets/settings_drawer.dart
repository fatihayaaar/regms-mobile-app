import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/search.dart';

Widget buildDrawer({required context}) {
  return Drawer(
    width: double.infinity,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        children: [
          _buildHeader(context: context),
          SizedBox(height: 10),
          buildSearch(),
          SizedBox(height: 20),
          _buildListItem("Account"),
          Divider(color: kBorderColor),
          _buildListItem("Notifications"),
          Divider(color: kBorderColor),
          _buildListItem("Appearance"),
          Divider(color: kBorderColor),
          _buildListItem("Privacy & Security"),
          Divider(color: kBorderColor),
          _buildListItem("Help and Support"),
          Divider(color: kBorderColor),
          _buildListItem("About"),
          Divider(color: kBorderColor),
          _buildListItem("Log-out"),
        ],
      ),
    ),
  );
}

Widget _buildListItem(String text) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
    child: Row(
      children: [
        Expanded(child: Text(text, style: kListTextStyle)),
        Icon(
          Icons.arrow_forward_ios,
          color: kBodyTextColor,
          size: 16,
        ),
      ],
    ),
  );
}

Widget _buildHeader({required context}) {
  return Container(
    height: 60,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Settings",
                style: kListTitleTextStyle,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: kAppbarColor,
              size: 25,
            ),
          ),
        )
      ],
    ),
  );
}
