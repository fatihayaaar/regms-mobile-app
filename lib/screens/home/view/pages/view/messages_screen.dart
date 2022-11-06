import 'package:flutter/material.dart';

import '../../../../../constants/styles.dart';
import '../../../../../models/user/user_message_item.dart';
import '../../../../../widgets/appbar/appbar.dart';
import '../../../../../widgets/page.dart';
import '../../../../../widgets/search.dart';
import '../../../../../widgets/show_more_widget.dart';
import '../../../../../widgets/tiles/user_message_tile.dart';

class MessagesScreen extends StatelessWidget {
  final onClickBackPage;
  var messages = [
    UserMessageItem(
      username: 'fayar',
      messageContent: "deneme 123",
      avatar: "assets/images/dump_1.jpg",
      isStory: true,
      newMessageCount: 2,
      date: "15:35",
    ),
    UserMessageItem(
      username: 'polat',
      messageContent: "ms_flutter_client/views/widgets/tiles/user_me",
      avatar: "assets/images/dump_2.jpg",
      isStory: false,
      newMessageCount: 0,
      date: "15:35",
    ),
    UserMessageItem(
      username: 'erdem',
      messageContent: "deneme 123",
      avatar: "assets/images/dump_2.jpg",
      isStory: true,
      newMessageCount: 2,
      date: "15:35",
    ),
    UserMessageItem(
      username: 'fayar',
      messageContent: "deneme 123",
      avatar: "assets/images/dump_1.jpg",
      isStory: false,
      newMessageCount: 99,
      date: "15:35",
    ),
    UserMessageItem(
      username: 'fayar',
      messageContent: "deneme 123",
      avatar: "assets/images/dump_1.jpg",
      isStory: true,
      newMessageCount: 0,
      date: "15:35",
    ),
    UserMessageItem(
      username: 'fayar',
      messageContent: "deneme 123",
      avatar: "assets/images/dump_1.jpg",
      isStory: true,
      newMessageCount: 0,
      date: "15:35",
    ),
  ];

  MessagesScreen({
    super.key,
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
        //_buildRequests(),
        _buildMessages(),
      ],
    );
  }

  _buildSearch() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: const Search(),
    );
  }

  _buildRequests() {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
      child: Row(
        children: [
          const ShowMore(text: "Message Requests"),
          Container(
            width: 30,
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
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
      physics: const NeverScrollableScrollPhysics(),
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
      child: const Icon(
        Icons.message,
        color: Colors.white,
      ),
    );
  }
}
