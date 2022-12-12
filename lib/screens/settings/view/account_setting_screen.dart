import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../../../widgets/appbar/appbar_settings.dart';
import '../../../widgets/drawer/drawer_list_item.dart';
import '../viewmodel/account_setting_view_model.dart';
import 'change_email_screen.dart';
import 'change_password_screen.dart';
import 'change_username_screen.dart';

class AccountSettingsScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<AccountSettingViewModel>(
      viewModel: AccountSettingViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<AccountSettingViewModel>.value(
          value: viewModel,
          builder: (context, child) {
            return _buildDrawer();
          },
        );
      },
    );
  }

  Widget _buildDrawer() => Drawer(
        width: double.infinity,
        child: Scaffold(
          appBar: const AppBarSettings(title: "Account Settings"),
          body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return false;
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 10),
                  DrawerListItem(
                    text: "Change Username",
                    page: ChangeUsernameScreen(),
                  ),
                  const Divider(color: ColorSchemeLight.kBorderColor),
                  DrawerListItem(
                    text: "Change Email Address",
                    page: ChangeEmailScreen(),
                  ),
                  const Divider(color: ColorSchemeLight.kBorderColor),
                  DrawerListItem(
                    text: "Change Password",
                    page: ChangePasswordScreen(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
