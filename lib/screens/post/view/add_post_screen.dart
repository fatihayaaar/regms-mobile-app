import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles.dart';
import '../../../core/models/base/base_stateless_widget.dart';
import '../../../core/models/base/base_view.dart';
import '../../../product/theme/theme_mode/light/color_scheme_light.dart';
import '../viewmodel/add_post_view_model.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/page.dart';
import '../../../widgets/photos_selection.dart';

class AddPostScreen extends BaseStatelessWidget {
  final TextEditingController? textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<AddPostViewModel>(
      viewModel: AddPostViewModel(),
      onModelReady: onModelReady,
      initialState: initialState,
      builder: (context, viewModel) {
        this.context = context;
        return ChangeNotifierProvider<AddPostViewModel>.value(
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

  PreferredSizeWidget _buildAppBar() => const MyAppBar(
        title: "New Post",
        isSaveAction: true,
        saveActionText: "Send",
      );

  Widget _buildBody() => SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: PageWidget(
            isRadius: false,
            child: _buildContent(),
          ),
        ),
      );

  Widget _buildContent() => NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildContentHeader(),
                _buildTextField(),
                _buildPhotos(),
                const SizedBox(height: 20),
                _buildAddPostIconItems(),
              ],
            ),
          ),
        ),
      );

  Widget _buildContentHeader() => Container(
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

  Widget _buildSelection() => Container(
        decoration: kFilterBoxDecorationTextField,
        margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
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
                icon: const Icon(
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

  Widget _buildAddPostIconItems() => Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildIconButtonItem(
              Icons.photo_outlined,
              "Photos",
              Colors.red,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(color: ColorSchemeLight.kBorderColor),
            ),
            _buildIconButtonItem(
              Icons.location_on,
              "Location",
              Colors.blue,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(color: ColorSchemeLight.kBorderColor),
            ),
            _buildIconButtonItem(
              Icons.discount,
              "Labels",
              Colors.deepOrange,
            ),
            const SizedBox(height: 20),
          ],
        ),
      );

  Widget _buildIconButtonItem(IconData icon, String text, color) => Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: Container(
          height: 30,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: kAddPostItemBoxDecorationTextField,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 22,
              ),
              const SizedBox(width: 10),
              Text(text, style: kAddPostItemsTextStyle),
            ],
          ),
        ),
      );

  Widget _buildTextField() => Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 8),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
          child: TextFormField(
            controller: textController,
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Write something...',
              hintStyle: kHintTextStyle,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildPhotos() => Consumer<AddPostViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          return PhotosSelection(photos: value.photos);
        },
      );
}
