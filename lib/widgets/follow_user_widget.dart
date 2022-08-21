import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

class FollowUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
      child: ListTile(
        minVerticalPadding: 0,
        minLeadingWidth: 10,
        horizontalTitleGap: 5,
        contentPadding: EdgeInsets.zero,
        leading: buildAvatar(
          size: 28,
          borderColor: kThemeColor,
          img: 'assets/images/dump_1.jpg',
        ),
        title: Text(
          "fayar",
          style: kAgendaTextStyle,
        ),
        subtitle: Text(
          "Software Developer :)",
          overflow: TextOverflow.ellipsis,
          style: kAgendaDetailTextStyle,
        ),
        trailing: Container(
          width: 90,
          height: 25,
          decoration: BoxDecoration(
            color: kAppbarColor,
            border: Border.all(color: kThemeColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: kTransparentButtonButtonStyle,
            child: Text("Follow"),
          ),
        ),
        dense: true,
      ),
    );
  }
}