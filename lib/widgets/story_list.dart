import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class StoryList extends StatelessWidget {
  final list;

  StoryList({
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kBorderColor.withOpacity(0.5)),
        ),
        color: kThemeColor,
      ),
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        itemCount: list.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Avatar(
                      borderColor: Colors.white,
                      img: "assets/images/dump_1.jpg",
                      size: 32,
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
                          color: Colors.indigoAccent,
                        ),
                        height: 22,
                        width: 22,
                        child: Icon(
                          Icons.add,
                          color: kThemeColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
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
