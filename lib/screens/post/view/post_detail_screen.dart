import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/post_detail_view_model.dart';
import '../../../widgets/appbar/appbar_transparent.dart';
import '../../../widgets/cards/post_card.dart';
import '../../../widgets/page.dart';

class PostDetailScreen extends StatefulWidget {
  static const routeName = '/post_detail_screen';
  final post;

  const PostDetailScreen({
    super.key,
    required this.post,
  });

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState(post);
}

class _PostDetailScreenState extends State {
  final post;

  _PostDetailScreenState(this.post);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return PostDetailViewModel(post: post);
      },
      child: Scaffold(
        appBar: AppBarTransparent(
          isBackArrow: true,
          isAction: true,
        ),
        body: _buildBody(),
      ),
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
