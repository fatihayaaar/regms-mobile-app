import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/app_bar/appbar.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State {
  TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Add"),
      body: _buildBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  _buildBody() {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildTextField(),
              Expanded(child: Container()),
              _buildAddPostIconItems(),
            ],
          ),
        ),
      ),
    );
  }

  _buildAddPostIconItems() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildIconButtonItem(
            Icons.photo_outlined,
            "Photos",
            Colors.red,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Divider(color: kBorderColor),
          ),
          _buildIconButtonItem(
            Icons.location_on,
            "Location",
            Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Divider(color: kBorderColor),
          ),
          _buildIconButtonItem(
            Icons.emoji_emotions_outlined,
            "Emoji",
            Colors.yellow,
          ),
          SizedBox(height: 20),
          _buildSendButtonItems(),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  _buildIconButtonItem(IconData icon, String text, color) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Container(
        height: 30,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: kAddPostItemBoxDecorationTextField,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 22,
            ),
            SizedBox(width: 10),
            Text(text, style: kAddPostItemsTextStyle),
          ],
        ),
      ),
    );
  }

  _buildSendButtonItems() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
      child: Row(
        children: [
          _buildDraftButton(),
          SizedBox(width: 10),
          _buildPostButton(),
        ],
      ),
    );
  }

  _buildDraftButton() {
    return Expanded(
      flex: 4,
      child: Container(
        height: 40,
        decoration: kBoxDecorationTextField,
        alignment: Alignment.center,
        child: Text("Draft", style: kDraftButtonTitleTextStyle),
      ),
    );
  }

  _buildPostButton() {
    return Expanded(
      flex: 5,
      child: Container(
        height: 40,
        decoration: kAddPostBoxDecorationTextField,
        alignment: Alignment.center,
        child: Text("Post", style: kAddPostTitleTextStyle),
      ),
    );
  }

  _buildTextField() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 8),
      child: Expanded(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
          child: TextFormField(
            controller: textController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Write something...',
              hintStyle: kHintTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
