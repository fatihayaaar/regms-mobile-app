import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/color_scheme_light.dart';
import 'package:regms_flutter_client/screens/post/viewmodel/add_post_view_model.dart';
import 'package:regms_flutter_client/widgets/appbar/appbar.dart';
import 'package:regms_flutter_client/widgets/page.dart';
import 'package:regms_flutter_client/widgets/photos_selection.dart';

class AddPostScreen extends StatelessWidget {
  static const routeName = '/add-post';
  final TextEditingController? textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return AddPostViewModel();
      },
      child: Scaffold(
        appBar: MyAppBar(
          title: "New Post",
          isSaveAction: true,
          saveActionText: "Send",
        ),
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildContentHeader(),
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

  _buildContentHeader() {
    return Container(
      width: double.infinity,
      height: 40,
      color: ColorSchemeLight.kBorderColor.withOpacity(0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildSelection(),
        ],
      ),
    );
  }

  _buildSelection() {
    return Container(
      decoration: kFilterBoxDecorationTextField,
      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
      child: SizedBox(
        height: 20,
        width: 200,
        child: Consumer<AddPostViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return DropdownButton(
              value: value.selectedTag,
              items: value.items.map<DropdownMenuItem<String>>((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              icon: Icon(
                Icons.arrow_drop_down,
                size: 20,
              ),
              onChanged: (val) => value.dropDownButtonOnChanges(val),
              isExpanded: true,
              underline: Container(),
              style: kLabelTextStyle,
              elevation: 1,
            );
          },
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
            child: Divider(color: ColorSchemeLight.kBorderColor),
          ),
          _buildIconButtonItem(
            Icons.location_on,
            "Location",
            Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Divider(color: ColorSchemeLight.kBorderColor),
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
    return Consumer<AddPostViewModel>(
      builder: (BuildContext context, value, Widget? child) {
        return PhotosSelection(photos: value.photos);
      },
    );
  }
}
