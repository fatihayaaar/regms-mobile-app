import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/views/widgets/avatar.dart';

class StoryList extends StatelessWidget {
  final list;
  final onClickAddStory;

  StoryList({
    required this.list,
    this.onClickAddStory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        itemCount: list.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (list[index].isVisibleAdd!) {
                onClickAddStory();
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 7.5, 0),
                      child: Avatar(
                        borderColor: Colors.white,
                        img: "assets/images/dump_1.jpg",
                        size: 28,
                        isStory: true,
                      ),
                    ),
                    Visibility(
                      visible: list[index].isVisibleAdd!,
                      child: Positioned(
                        right: 4,
                        bottom: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          height: 19,
                          width: 19,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  width: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "fayarrrrrrrrrrrr",
                    style: kStoryMiniUsernameTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
