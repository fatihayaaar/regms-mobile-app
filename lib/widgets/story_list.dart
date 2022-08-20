import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class StoryList extends StatefulWidget {
  final list;

  StoryList({
    required this.list,
  });

  @override
  State<StatefulWidget> createState() => _StoryListState(list);
}

class _StoryListState extends State {
  var list;

  _StoryListState(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: kBorderColor)),
        color: kThemeColor,
      ),
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        itemCount: 10,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: buildAvatar(
                  borderColor: Colors.white,
                  img: "assets/images/dump_1.jpg",
                  size: 32,
                  isStory: true,
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: 70,
                alignment: Alignment.center,
                child: Text(
                  "fayarrrrrrrrrrrr",
                  style: kStoryMiniUsernameTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}