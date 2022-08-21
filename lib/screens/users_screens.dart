import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/app_bar/appbar.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';
import 'package:regms_flutter_client/widgets/page.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Followers", backButtonVisibility: true),
      body: PageWidget(child: _buildContent()),
      //bottomNavigationBar: BottomNavBar(selected: -2),
    );
  }

  _buildContent() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
          child: ListTile(
            minVerticalPadding: 0,
            contentPadding: EdgeInsets.zero,
            leading: buildAvatar(
              size: 25,
              borderColor: kThemeColor,
              img: 'assets/images/dump_1.jpg',
            ),
            title: Text(
              "fayar",
              style: kAgendaTextStyle,
            ),
            subtitle: Text(
              "Software Developer :)",
              style: kAgendaDetailTextStyle,
            ),
            dense: true,
          ),
        );
      },
    );
  }
}
