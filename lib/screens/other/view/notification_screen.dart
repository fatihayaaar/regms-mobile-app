import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/notification_view_model.dart';
import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../models/user/user_list_item.dart';
import '../../../widgets/appbar/appbar_settings.dart';
import '../../../widgets/tiles/notification_tile.dart';

class NotificationScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationViewModel>(
      viewModel: NotificationViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<NotificationViewModel>.value(
          value: viewModel,
          builder: (context, child) {
            return Scaffold(
              appBar: _buildAppBar(),
              body: _buildBody(),
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() => const AppBarSettings(title: "Notifications");

  Widget _buildBody() => NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: SingleChildScrollView(
            child: _buildNotifications(),
          ),
        ),
      );

  Widget _buildNotifications() => ListView.builder(
        itemCount: 25,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return NotificationTile(
            user: UserListItem(
              username: 'deneme',
              avatar: "assets/images/dump_1.jpg",
            ),
          );
        },
      );
}
