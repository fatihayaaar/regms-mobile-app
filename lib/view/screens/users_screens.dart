import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/models/user/user_list_tile.dart';
import 'package:regms_flutter_client/view_models/users_view_model.dart';
import 'package:regms_flutter_client/view/widgets/appbar/appbar.dart';
import 'package:regms_flutter_client/view/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/view/widgets/page.dart';
import 'package:regms_flutter_client/view/widgets/search.dart';
import 'package:regms_flutter_client/view/widgets/tiles/follow_user_tile.dart';
import 'package:regms_flutter_client/view/widgets/tiles/user_request_tile.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return UsersViewModel();
      },
      child: Scaffold(
        appBar: MyAppBar(
          title: "Followers",
          backButtonVisibility: true,
        ),
        body: PageWidget(child: _buildContent()),
        bottomNavigationBar: BottomNavBar(selected: -2),
      ),
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
        Consumer<UsersViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: value.users.length,
              itemBuilder: (BuildContext context, int index) {
                return ChangeNotifierProvider.value(
                  value: value.users.elementAt(index),
                  child: Consumer<UserListTile>(
                    builder: (BuildContext context, value, Widget? child) {
                      return FollowUserTile(
                        user: value,
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  _buildFollowRequestItem() {
    return Column(
      children: [
        Consumer<UsersViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return UserRequestTile(
              user: value.userRequest,
            );
          },
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Divider(color: kBorderColor),
        ),
      ],
    );
  }
}
