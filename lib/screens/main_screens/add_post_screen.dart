import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar.dart';
import 'package:regms_flutter_client/widgets/page.dart';
import 'package:regms_flutter_client/widgets/photos_selection.dart';

class AddPostScreen extends StatefulWidget {
  static const routeName = '/add_post';

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State {
  var photos = ["assets/images/dump_1.jpg", "assets/images/dump_1.jpg"];

  TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Add"),
      body: _buildBody(),
      floatingActionButton: _buildFAB(),
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
        child: PageWidget(
          isRadius: false,
          child: _buildContent(),
        ),
      ),
    );
  }

  _buildContent() {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return false;
      },
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(height: 5),
              _buildTextField(),
              _buildPhotos(),
              SizedBox(height: 20),
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
            Icons.discount,
            "Labels",
            Colors.deepOrange,
          ),
          SizedBox(height: 20),
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

  _buildTextField() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 8),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
        child: TextFormField(
          controller: textController,
          maxLines: null,
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
    );
  }

  _buildPhotos() {
    return PhotosSelection(photos: photos);
  }

  _buildFAB() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: kAppbarColor,
      elevation: 0,
      child: Icon(Icons.send),
    );
  }
}
