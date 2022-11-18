import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../services/add_post_service.dart';
import '../../../core/models/base/base_view_model.dart';
import '../../../product/network/base/base_service.dart';

class AddPostViewModel extends BaseViewModel<AddPostService> {
  var _photos = ["assets/images/dump_1.jpg", "assets/images/dump_1.jpg"];
  var _items = [
    'My Profile',
    'Group 1',
    'Group 2',
    'Group 3',
  ];
  var _selectedTag = "My Profile";

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = AddPostService(
      networkManager: context!.networkManager,
    );
  }

  void dropDownButtonOnChanges(val) {
    selectedTag = val;
  }

  get photos => _photos;

  set photos(photos) {
    _photos = photos;
    notifyListeners();
  }

  get items => _items;

  set items(items) {
    _items = items;
    notifyListeners();
  }

  get selectedTag => _selectedTag;

  set selectedTag(selectedTag) {
    _selectedTag = selectedTag;
    notifyListeners();
  }
}
