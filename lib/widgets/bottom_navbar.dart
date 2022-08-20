import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/main.dart';
import 'package:regms_flutter_client/screens/add_post_screen.dart';
import 'package:regms_flutter_client/screens/home_screen.dart';
import 'package:regms_flutter_client/screens/login_screen.dart';
import 'package:regms_flutter_client/screens/profile_screen.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  int selected;

  BottomNavBar({required this.selected});

  @override
  State<StatefulWidget> createState() {
    return BottomNavBarState(selected);
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  int selected;

  BottomNavBarState(this.selected);

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
              page: HomeScreen(),
              icon: Icons.home_outlined,
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildItem(
              page: LoginScreen(),
              icon: Icons.messenger_outline,
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildItem(
              page: AddPostScreen(),
              icon: Icons.add_circle_outline_sharp,
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildItem(
              page: LoginScreen(),
              icon: Icons.search_rounded,
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildAvatarItem(
              page: root.myUser != null
                  ? ProfileScreen(user: root.myUser!, isMyProfile: true)
                  : LoginScreen(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({required Widget page, required IconData icon}) {
    return ElevatedButton(
      style: kTransparentButtonButtonStyle,
      onPressed: () {
        Navigator.push(context, _createRoute(page));
      },
      child: selected == 1
          ? Icon(icon, size: 25, color: kAppbarColor)
          : Icon(icon, size: 25, color: kAppbarColor),
    );
  }

  Widget _buildAvatarItem({required Widget page}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, _createRoute(page));
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

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
