import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../widgets/appbar/appbar_settings.dart';
import '../viewmodel/notification_setting_view_model.dart';

class NotificationSettingsScreen extends BaseStatelessWidget {
  bool? switchListTileValue;

  NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationSettingViewModel>(
      viewModel: NotificationSettingViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<NotificationSettingViewModel>.value(
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

  PreferredSizeWidget _buildAppBar() => const AppBarSettings(title: "Notification");

  Widget _buildBody() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            _buildNotificationItem('Messages'),
            _buildNotificationItem('Followers'),
            _buildNotificationItem('Posts'),
          ],
        ),
      );

  Widget _buildNotificationItem(String text) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SwitchListTile(
          contentPadding: const EdgeInsets.all(0),
          value: switchListTileValue ??= true,
          onChanged: (value) {},
          // onChanged: (newValue) => setState(() => switchListTileValue = newValue),
          title: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          dense: true,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      );
}
