import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../models/user/user_list_item.dart';
import '../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/bottom_navbar.dart';
import '../../../widgets/page.dart';
import '../../../widgets/search.dart';
import '../../../widgets/tiles/follow_user_tile.dart';
import '../../../widgets/tiles/user_request_tile.dart';
import '../viewmodel/users_view_model.dart';

class UsersScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<UsersViewModel>(
      viewModel: UsersViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<UsersViewModel>.value(
          value: viewModel,
          builder: (context, child) {
            return Scaffold(
              appBar: _buildAppBar(),
              body: _buildBody(),
              bottomNavigationBar: const BottomNavBar(selected: -2),
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() => const MyAppBar(
        title: "Followers",
        backButtonVisibility: true,
      );

  Widget _buildBody() => PageWidget(child: _buildContent());

  Widget _buildContent() => Column(
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

  Widget _buildFollowRequestItem() => Column(
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
