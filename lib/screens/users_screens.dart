import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/models/user_list_tile.dart';
import 'package:regms_flutter_client/widgets/app_bar/appbar.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/follow_user_tile.dart';
import 'package:regms_flutter_client/widgets/page.dart';
import 'package:regms_flutter_client/widgets/search.dart';
import 'package:regms_flutter_client/widgets/user_request_tile.dart';

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
      appBar: AppBarWidget(
        context: context,
        title: "Followers",
        backButtonVisibility: true,
      ),
      body: PageWidget(child: _buildContent()),
      bottomNavigationBar: BottomNavBar(selected: -2, context: context),
    );
  }

  _buildContent() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Search(),
        ),
        _buildFollowRequestItem(),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return FollowUserTile(
              user: users[index],
            );
          },
        ),
      ],
    );
  }

  _buildFollowRequestItem() {
    return Column(
      children: [
        UserRequestTile(
          user: UserListTile(
            username: 'Folloer Request',
            avatar: "assets/images/dump_1.jpg",
            nameAndSurname: "Approve or delete requests",
            isFollow: false,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Divider(color: kBorderColor),
        ),
      ],
    );
  }
}
