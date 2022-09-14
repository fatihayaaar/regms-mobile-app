import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/views/widgets/appbar/appbar.dart';
import 'package:regms_flutter_client/views/widgets/page.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Messages",
        backButtonVisibility: true,
      ),
      body: PageWidget(child: _buildBody()),
    );
  }

  _buildBody() {
    return Container(
      height: 100,
      color: kThemeColor,
    );
  }
}
