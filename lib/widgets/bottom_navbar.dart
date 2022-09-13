import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/main.dart';
import 'package:regms_flutter_client/route.dart';
import 'package:regms_flutter_client/screens/main_screens/add_post_screen.dart';
import 'package:regms_flutter_client/screens/main_screens/home_screen/home_screen.dart';
import 'package:regms_flutter_client/screens/main_screens/profile_screen.dart';
import 'package:regms_flutter_client/screens/main_screens/search_screen.dart';
import 'package:regms_flutter_client/screens/main_screens/videos_screen.dart';
import 'package:regms_flutter_client/screens/membership_screens/login_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selected;

  BottomNavBar({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        border: Border(
          top: BorderSide(
            color: kBorderColor,
            width: 0.5,
          ),
        ),
      ),
      height: 45,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: _buildItem(
              context,
              routeName: HomeScreen.routeName,
              icon: Icons.home_outlined,
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildItem(
              context,
              routeName: VideosScreen.routeName,
              icon: Icons.slow_motion_video,
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildItem(
              context,
              routeName: AddPostScreen.routeName,
              icon: Icons.add_circle_outline_sharp,
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildItem(
              context,
              routeName: SearchScreen.routeName,
              icon: Icons.search_rounded,
            ),
          ),
          Expanded(
            flex: 1,
            child: appService.providerPersistHelper.myUser != null
                ? _buildAvatarItem(
                    context,
                    routeName: ProfileScreen.routeName,
                    param: {
                      "user": appService.providerPersistHelper.myUser!,
                      "isMyProfile": true,
                    },
                  )
                : _buildAvatarItem(
                    context,
                    routeName: LoginScreen.routeName,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(context, {required routeName, required icon, param}) {
    return ElevatedButton(
      style: kTransparentButtonButtonStyle,
      onPressed: () {
        var route = MyRoute.onGenerateRoute(
          routeName,
          param: param,
        );
        Navigator.push(context, route);
      },
      child: selected == 1
          ? Icon(icon, size: 25, color: kAppbarColor)
          : Icon(icon, size: 25, color: kAppbarColor),
    );
  }

  Widget _buildAvatarItem(context, {required String routeName, param}) {
    return ElevatedButton(
      onPressed: () {
        var route = MyRoute.onGenerateRoute(
          routeName,
          param: param,
        );
        Navigator.push(context, route);
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
    );
  }
}
