import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/images.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/screens/login_screen.dart';
import 'package:regms_flutter_client/screens/my_profile_screen.dart';

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
      height: 55,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: _buildItem(
                page: LoginScreen(),
                svg: heart,
                svgClicked: heartFill,
              )),
          Expanded(
              flex: 1,
              child: _buildItem(
                page: LoginScreen(),
                svg: messages,
                svgClicked: messagesFill,
              )),
          Expanded(
              flex: 1,
              child: _buildItem(
                page: LoginScreen(),
                svg: search,
                svgClicked: searchFill,
              )),
          Expanded(flex: 2, child: _buildAvatarItem(page: MyProfileScreen())),
        ],
      ),
    );
  }

  Widget _buildItem(
      {required Widget page, required Widget svg, required Widget svgClicked}) {
    return Container(
      height: 19.03,
      width: 19.03,
      child: ElevatedButton(
        style: kTransparentButtonButtonStyle,
        onPressed: () {
          Navigator.push(context, _createRoute(page));
        },
        child: selected == 1 ? svgClicked : svg,
      ),
    );
  }

  Widget _buildAvatarItem({required Widget page}) {
    return Container(
      height: 35,
      width: 35,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, _createRoute(page));
        },
        style: kTransparentButtonButtonStyle,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.5),
            radius: 20,
            backgroundImage: AssetImage("assets/images/dump_1.jpg"),
            //child: Image.file(),
          ),
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
