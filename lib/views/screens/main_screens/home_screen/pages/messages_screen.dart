import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/user/user_message_list_tile.dart';
import 'package:regms_flutter_client/views/widgets/appbar/appbar.dart';
import 'package:regms_flutter_client/views/widgets/page.dart';
import 'package:regms_flutter_client/views/widgets/search.dart';
import 'package:regms_flutter_client/views/widgets/show_more_widget.dart';
import 'package:regms_flutter_client/views/widgets/tiles/user_message_tile.dart';

class MessagesScreen extends StatelessWidget {
  final onClickBackPage;
  var messages = [
    UserMessageListTile(
      username: 'fayar',
      messageContent: "deneme 123",
      avatar: "assets/images/dump_1.jpg",
      isStory: true,
      newMessageCount: 2,
      date: "15:35",
    ),
    UserMessageListTile(
      username: 'polat',
      messageContent: "ms_flutter_client/views/widgets/tiles/user_me",
      avatar: "assets/images/dump_2.jpg",
      isStory: false,
      newMessageCount: 0,
      date: "15:35",
    ),
    UserMessageListTile(
      username: 'erdem',
      messageContent: "deneme 123",
      avatar: "assets/images/dump_2.jpg",
      isStory: true,
      newMessageCount: 2,
      date: "15:35",
    ),
    UserMessageListTile(
      username: 'fayar',
      messageContent: "deneme 123",
      avatar: "assets/images/dump_1.jpg",
      isStory: false,
      newMessageCount: 99,
      date: "15:35",
    ),
    UserMessageListTile(
      username: 'fayar',
      messageContent: "deneme 123",
      avatar: "assets/images/dump_1.jpg",
      isStory: true,
      newMessageCount: 0,
      date: "15:35",
    ),
    UserMessageListTile(
      username: 'fayar',
      messageContent: "deneme 123",
      avatar: "assets/images/dump_1.jpg",
      isStory: true,
      newMessageCount: 0,
      date: "15:35",
    ),
  ];

  MessagesScreen({
    required this.onClickBackPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Messages",
        backButtonVisibility: true,
        onClickBackButton: onClickBackPage,
      ),
      body: PageWidget(child: _buildBody(context)),
      floatingActionButton: _buildFAB(context),
    );
  }

  _buildBody(context) {
    return Column(
      children: [
        _buildSearch(),
        _buildRequests(),
        _buildMessages(),
      ],
    );
  }

  _buildSearch() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Search(),
    );
  }

  _buildRequests() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
      child: Row(
        children: [
          ShowMore(text: "Message Requests"),
          Container(
            width: 30,
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black38,
              ),
              child: Text(
                "2",
                style: kUserListActionTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildMessages() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        return UserMessageTile(
          user: messages[index],
        );
      },
    );
  }

  _buildFAB(context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      child: Icon(
        Icons.message,
        color: Colors.white,
      ),
    );
  }
}
