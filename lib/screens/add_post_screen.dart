import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/widgets/app_bar/appbar.dart';
import 'package:regms_flutter_client/widgets/avatar.dart';

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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 8),
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: TextFormField(
                      controller: textController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Write something...',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              Divider(
                height: 5,
                thickness: 1,
                color: kBorderColor,
              ),
              _buildAddPostIconItems(),
            ],
          ),
        ),
      ),
    );
  }

  _buildAddPostIconItems() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildIconButtonItem(Icons.photo_outlined),
              _buildIconButtonItem(Icons.video_call),
              _buildIconButtonItem(Icons.location_on),
              _buildIconButtonItem(Icons.emoji_emotions_outlined),
            ],
          ),
        ],
      ),
    );
  }

  _buildIconButtonItem(IconData icon) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: IconButton(
        icon: Icon(
          icon,
          color: Color(0xFF57636C),
          size: 22,
        ),
        onPressed: () {},
      ),
    );
  }
}
