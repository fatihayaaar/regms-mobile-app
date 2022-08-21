import 'package:flutter/material.dart';
import 'package:regms_flutter_client/models/user_list_tile.dart';
import 'package:regms_flutter_client/widgets/app_bar/appbar.dart';
import 'package:regms_flutter_client/widgets/follow_user_widget.dart';
import 'package:regms_flutter_client/widgets/page.dart';
import 'package:regms_flutter_client/widgets/search.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State {
  var users = [
    UserListTile(
      username: 'fayar',
      avatar: "assets/images/dump_1.jpg",
      nameAndSurname: "Fatih Ayar",
      isFollow: false,
      isStory: true,
    ),
    UserListTile(
      username: 'berkcanoz',
      avatar: "assets/images/dump_2.jpg",
      nameAndSurname: "Berkercan",
      isFollow: false,
    ),
    UserListTile(
      username: 'damali',
      avatar: "assets/images/dump_2.jpg",
      isFollow: false,
    ),
    UserListTile(
      username: 'polat',
      avatar: "assets/images/dump_1.jpg",
      isFollow: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Followers", backButtonVisibility: true),
      body: PageWidget(child: _buildContent()),
      //bottomNavigationBar: BottomNavBar(selected: -2),
    );
  }

  _buildContent() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
          child: Search(),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return FollowUser(
              user: users[index],
            );
          },
        ),
      ],
    );
  }
}
