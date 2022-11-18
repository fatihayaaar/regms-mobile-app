import 'package:flutter/material.dart';

import '../../../product/extensions/context_extension.dart';
import '../services/search_service.dart';
import '../../../core/models/base/base_view_model.dart';
import '../../../product/network/base/base_service.dart';

class SearchViewModel extends BaseViewModel<SearchService> {
  var _selectedTag = "Global Trend Topic";
  var _items = ['Global Trend Topic', 'Turkey Trend Topic', 'Local Trend Topi'];
  var _searchList = ["All", "User", "Group", "Post", "Tags", "Video"];
  var _isSearch = false;

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = SearchService(
      networkManager: context!.networkManager,
    );
  }

  void searchOnChange(val) {
    if (val == null) {
      isSearch = false;
      return;
    }
    if (val == "") {
      isSearch = false;
    } else {
      isSearch = true;
    }
  }

  void dropDownButtonOnChanges(val) {
    selectedTag = val;
  }

  get selectedTag => _selectedTag;

  set selectedTag(val) {
    _selectedTag = val;
    notifyListeners();
  }

  get items => _items;

  set items(val) {
    _items = val;
    notifyListeners();
  }

  get searchList => _searchList;

  set searchList(val) {
    _searchList = val;
    notifyListeners();
  }

  get isSearch => _isSearch;

  set isSearch(val) {
    _isSearch = val;
    notifyListeners();
  }
}
