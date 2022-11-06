import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/user/user_list_item.dart';
import '../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../viewmodel/users_view_model.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/bottom_navbar.dart';
import '../../../widgets/page.dart';
import '../../../widgets/search.dart';
import '../../../widgets/tiles/follow_user_tile.dart';
import '../../../widgets/tiles/user_request_tile.dart';

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
        appBar: const MyAppBar(
          title: "Followers",
          backButtonVisibility: true,
        ),
        body: PageWidget(child: _buildContent()),
        bottomNavigationBar: const BottomNavBar(selected: -2),
      ),
    );
  }

  _buildContent() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: const Search(),
        ),
        _buildFollowRequestItem(),
        Consumer<UsersViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.users.length,
              itemBuilder: (BuildContext context, int index) {
                return ChangeNotifierProvider.value(
                  value: value.users.elementAt(index),
                  child: Consumer<UserListItem>(
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
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: const Divider(color: ColorSchemeLight.kBorderColor),
        ),
      ],
    );
  }
}
