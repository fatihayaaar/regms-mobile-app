import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/images.dart';

class MyTab {
  List<Widget> tabs;

  MyTab({
    required this.tabs,
  });

  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: double.maxFinite,
      child: DefaultTabController(
        length: 3,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(40, 40),
              child: Container(
                height: 40,
                child: TabBar(
                  indicatorColor: kAppbarColor,
                  padding: EdgeInsets.zero,
                  tabs: [
                    _buildPostsHeaderItem(svg: messages),
                    _buildPostsHeaderItem(svg: search),
                    _buildPostsHeaderItem(svg: heart),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: tabs,
            ),
          ),
        ),
      ),
    );
  }

  _buildPostsHeaderItem({required Widget svg}) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      child: svg,
    );
  }
}
