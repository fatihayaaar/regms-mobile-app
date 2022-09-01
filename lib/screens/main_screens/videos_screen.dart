import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar_transparent.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/cards/video_full_screen_card.dart';

class VideosScreen extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTransparent(),
      body: _buildBody(),
      bottomNavigationBar: BottomNavBar(selected: -2),
    );
  }

  _buildBody() {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return VideoFullScreenCard();
          },
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _buildHeaderBar(),
        ),
      ],
    );
  }

  _buildHeaderBar() {
    return Container(
      height: 45,
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _buildTitle("Videos"),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _buildAddAction(),
          ),
        ],
      ),
    );
  }

  _buildTitle(String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: tAppbarTitleTextStyle,
      ),
    );
  }

  _buildAddAction() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Icon(
        Icons.add_circle_outline_sharp,
        color: Colors.white,
      ),
    );
  }
}
