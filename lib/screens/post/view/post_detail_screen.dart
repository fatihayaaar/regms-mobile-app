import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../widgets/appbar/appbar_transparent.dart';
import '../../../widgets/cards/post_card.dart';
import '../../../widgets/page.dart';
import '../viewmodel/post_detail_view_model.dart';

class PostDetailScreen extends BaseStatelessWidget {
  final post;

  PostDetailScreen({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<PostDetailViewModel>(
      viewModel: PostDetailViewModel(post: post),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<PostDetailViewModel>.value(
          value: viewModel,
          builder: (context, child) {
            return Scaffold(
              appBar: _buildAppBar(),
              body: _buildBody(),
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBarTransparent(
        isBackArrow: true,
        isAction: true,
      );

  Widget _buildBody() => PageWidget(
        child: Consumer<PostDetailViewModel>(
          builder: (context, value, child) {
            return PostCard(
              post: value.post,
              isCommentVisible: true,
              isDetail: true,
            );
          },
        ),
      );
}
