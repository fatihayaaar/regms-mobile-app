import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/views/screens/notification_screen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButtonVisibility;
  final bool isShowNotificationIcon;
  final bool isShowMessagesIcon;
  final onClickMessages;
  final double height;

  AppBarWidget({
    this.title = "",
    this.backButtonVisibility = true,
    this.isShowNotificationIcon = false,
    this.isShowMessagesIcon = false,
    this.onClickMessages,
    this.height = 45.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(this.height);

  @override
  Widget build(BuildContext context) {
    return _appBar(title, context);
  }

  _appBar(String title, context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: this.height,
      title: Row(
        children: [
          _buildBackArrow(context),
          _buildTitle(title),
          Flexible(child: Container()),
          _buildActions(context),
        ],
      ),
      backgroundColor: kAppbarColor,
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

  _buildBackArrow(context) {
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

  _buildActions(context) {
    return Row(
      children: [
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
      child: GestureDetector(
        onTap: onClickMessages,
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
      ),
    );
  }
}
