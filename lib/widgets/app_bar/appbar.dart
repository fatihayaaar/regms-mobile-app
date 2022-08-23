import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/screens/notification_screen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final context;
  final String title;
  final bool backButtonVisibility;
  final bool isShowNotificationIcon;
  final bool isShowMessagesIcon;

  AppBarWidget({
    required this.context,
    this.title = "",
    this.backButtonVisibility = true,
    this.isShowNotificationIcon = false,
    this.isShowMessagesIcon = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return _appBar(title);
  }

  _appBar(String title) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      title: Row(
        children: [
          _buildBackArrow(),
          _buildTitle(title),
          Flexible(child: Container()),
          _buildActions(),
        ],
      ),
      backgroundColor: kMainAppbarColor,
      iconTheme: IconThemeData(color: kThemeColor),
      shadowColor: Color.fromRGBO(0, 0, 0, 0),
    );
  }

  _buildTitle(String title) {
    return Flexible(
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Text(
          title,
          style: tAppbarTitleTextStyle,
        ),
      ),
    );
  }

  _buildBackArrow() {
    return Visibility(
      visible: backButtonVisibility,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }

  _buildActions() {
    return Row(
      children: [
        _buildNotificationIcon(),
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

  _buildNotificationIcon() {
    return Visibility(
      visible: isShowNotificationIcon,
      child: GestureDetector(
        onTap: () {
          var route = MaterialPageRoute(builder: (_) => NotificationScreen());
          Navigator.push(context, route);
        },
        child: Stack(
          children: [
            Icon(
              Icons.notifications,
              color: kThemeColor,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
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
      child: Stack(
        children: [
          Icon(
            Icons.chat,
            color: kThemeColor,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
