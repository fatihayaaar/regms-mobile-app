import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../main.dart';
import '../product/navigation/navigation.dart';
import '../product/theme/theme_mode/light/color_scheme_light.dart';

class BottomNavBar extends StatelessWidget {
  final int selected;
  final Function? onPressed;

  BottomNavBar({required this.selected, this.onPressed()?});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        border: Border(
          top: BorderSide(
            color: ColorSchemeLight.kBorderColor,
            width: 0.5,
          ),
        ),
      ),
      height: 45,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          _buildItem(
            context,
            routeName: Navigation.HOME_PAGE,
            icon: Icons.home_outlined,
          ),
          _buildItem(
            context,
            routeName: Navigation.VIDEOS_PAGE,
            icon: Icons.slow_motion_video,
          ),
          _buildItem(
            context,
            routeName: Navigation.ADD_POST_PAGE,
            icon: Icons.add_circle_outline_sharp,
          ),
          _buildItem(
            context,
            routeName: Navigation.SEARCH_PAGE,
            icon: Icons.search_rounded,
          ),
          appService.providerPersistHelper.myUser != null
              ? _buildAvatarItem(
                  context,
                  routeName: Navigation.PROFILE_PAGE,
                  param: {
                    "user": appService.providerPersistHelper.myUser!,
                    "isMyProfile": true,
                  },
                )
              : _buildAvatarItem(
                  context,
                  routeName: Navigation.LOGIN_PAGE,
                ),
        ],
      ),
    );
  }

  Widget _buildItem(context, {required routeName, required icon, param}) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: kTransparentButtonButtonStyle,
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
          appService.providerNavigationHelper.navigateToPage(
            path: routeName,
            object: param,
          );
        },
        child: selected == 1
            ? Icon(
                icon,
                size: 25,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              )
            : Icon(
                icon,
                size: 25,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
      ),
    );
  }

  Widget _buildAvatarItem(context, {required String routeName, param}) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
          appService.providerNavigationHelper.navigateToPage(
            path: routeName,
            object: param,
          );
        },
        style: kTransparentButtonButtonStyle,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.5),
            radius: 15,
            backgroundImage: AssetImage("assets/images/dump_1.jpg"),
            //child: Image.file(),
          ),
        ),
      ),
    );
  }
}
