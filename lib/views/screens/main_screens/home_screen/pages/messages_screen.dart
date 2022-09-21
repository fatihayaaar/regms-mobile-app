import 'package:flutter/material.dart';
import 'package:regms_flutter_client/views/widgets/appbar/appbar.dart';
import 'package:regms_flutter_client/views/widgets/page.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Messages",
        backButtonVisibility: true,
      ),
      body: PageWidget(child: _buildBody(context)),
    );
  }

  _buildBody(context) {
    return Container(
      height: 100,
      color: Theme.of(context).backgroundColor,
    );
  }
}
