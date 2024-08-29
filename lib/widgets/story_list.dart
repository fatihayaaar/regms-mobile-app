import 'package:flutter/material.dart';

import '../constants/styles.dart';
import 'avatar.dart';

class StoryList extends StatelessWidget {
  final list;
  final onClickAddStory;

  const StoryList({
    super.key,
    required this.list,
    this.onClickAddStory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        itemCount: list.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
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
                      margin: const EdgeInsets.fromLTRB(5, 0, 7.5, 0),
                      child: const Avatar(
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
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          height: 19,
                          width: 19,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
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
