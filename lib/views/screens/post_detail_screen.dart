import 'package:flutter/material.dart';
import 'package:regms_flutter_client/views/widgets/appbar/appbar_transparent.dart';
import 'package:regms_flutter_client/views/widgets/cards/post_card.dart';
import 'package:regms_flutter_client/views/widgets/page.dart';

class PostDetailScreen extends StatefulWidget {
  static const routeName = '/post_detail_screen';
  final post;

  PostDetailScreen({required this.post});

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState(post);
}

class _PostDetailScreenState extends State {
  final post;

  _PostDetailScreenState(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTransparent(
        isBackArrow: true,
        isAction: true,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return PageWidget(
      child: PostCard(
        post: post,
        isCommentVisible: true,
        isDetail: true,
      ),
    );
  }
}