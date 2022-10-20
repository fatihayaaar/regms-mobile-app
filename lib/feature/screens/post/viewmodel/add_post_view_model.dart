import 'package:flutter/material.dart';

class AddPostViewModel with ChangeNotifier {
  var _photos = ["assets/images/dump_1.jpg", "assets/images/dump_1.jpg"];
  var _items = [
    'My Profile',
    'Group 1',
    'Group 2',
    'Group 3',
  ];
  var _selectedTag = "My Profile";

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
