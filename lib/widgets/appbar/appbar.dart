import 'package:flutter/material.dart';

import '../../screens/other/view/notification_screen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButtonVisibility;
  final bool isShowNotificationIcon;
  final bool isShowMessagesIcon;
  final bool isSaveAction;
  final String saveActionText;
  final onClickMessages;
  final onClickBackButton;
  final double height;

  const MyAppBar({
    super.key,
    this.title = "",
    this.backButtonVisibility = true,
    this.isShowNotificationIcon = false,
    this.isShowMessagesIcon = false,
    this.isSaveAction = false,
    this.saveActionText = "Save",
    this.onClickMessages,
    this.onClickBackButton,
    this.height = 45.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      title: Row(
        children: [
          _buildBackArrow(context),
          _buildTitle(context, title),
          Flexible(child: Container()),
          _buildActions(context),
        ],
      ),
    );
  }

  _buildTitle(context, String title) {
    return Flexible(
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Text(title),
      ),
    );
  }

  _buildBackArrow(context) {
    return Visibility(
      visible: backButtonVisibility,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              if (onClickBackButton != null) {
                onClickBackButton();
              } else {
                Navigator.pop(context);
              }
            },
            child: const Icon(
              Icons.arrow_back,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }

  _buildActions(context) {
    return Row(
      children: [
        _buildSaveAction(context),
        _buildNotificationIcon(context),
        SizedBox(
            width: isShowNotificationIcon
                ? isShowMessagesIcon
                    ? 20
                    : 0
                : 0),
        _buildMessageIcon(),
      ],
    );
  }

  _buildNotificationIcon(context) {
    return Visibility(
      visible: isShowNotificationIcon,
      child: GestureDetector(
        onTap: () {
          var route = MaterialPageRoute(builder: (_) => NotificationScreen());
          Navigator.push(context, route);
        },
        child: Stack(
          children: [
            const Icon(Icons.notifications),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildMessageIcon() {
    return Visibility(
      visible: isShowMessagesIcon,
      child: GestureDetector(
        onTap: onClickMessages,
        child: Stack(
          children: [
            const Icon(Icons.chat),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSaveAction(context) {
    return Visibility(
      visible: isSaveAction,
      child: GestureDetector(
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.fromLTRB(7.5, 5, 7.5, 5),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(
            saveActionText,
            style: Theme.of(context).appBarTheme.toolbarTextStyle,
          ),
        ),
      ),
    );
  }
}
