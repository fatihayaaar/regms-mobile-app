import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/models/user/user_list_item.dart';
import 'package:regms_flutter_client/product/theme/theme_mode/light/color_scheme_light.dart';
import 'package:regms_flutter_client/feature/screens/other/viewmodel/search_view_model.dart';
import 'package:regms_flutter_client/feature/widgets/appbar/appbar_search.dart';
import 'package:regms_flutter_client/feature/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/feature/widgets/page.dart';
import 'package:regms_flutter_client/feature/widgets/selection_widget.dart';
import 'package:regms_flutter_client/feature/widgets/show_more_widget.dart';
import 'package:regms_flutter_client/feature/widgets/tiles/user_tile.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SearchViewModel();
      },
      child: Consumer<SearchViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          return Scaffold(
            appBar: AppBarSearchWidget(
              searchOnChanged: (val) {
                value.searchOnChange(val);
              },
            ),
            body: PageWidget(
              isRadius: false,
              child: _buildContent(),
            ),
            bottomNavigationBar: child,
          );
        },
        child: BottomNavBar(selected: -2),
      ),
    );
  }

  _buildContent() {
    return Consumer<SearchViewModel>(
      builder: (BuildContext context, value, Widget? child) {
        switch (value.isSearch) {
          case false:
            return child!;
          case true:
            return _buildSearchResult();
        }
        return Container();
      },
      child: _buildTrendTopic(),
    );
  }

  _buildSearchResult() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Consumer<SearchViewModel>(
            builder: (BuildContext context, value, Widget? child) {
              return SelectionWidget(list: value.searchList);
            },
          ),
          SizedBox(height: 10),
          _buildResultAll(),
        ],
      ),
    );
  }

  _buildTrendTopic() {
    return Column(
      children: [
        SizedBox(height: 15),
        _buildFilter(),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorSchemeLight.kBorderColor.withOpacity(0.5),
                  ),
                ),
              ),
              child: ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "#deneme",
                  style: kAgendaTextStyle,
                ),
                subtitle: Text(
                  "20k content",
                  style: kAgendaDetailTextStyle,
                ),
                dense: true,
              ),
            );
          },
        ),
      ],
    );
  }

  _buildFilter() {
    return Container(
      decoration: kFilterBoxDecorationTextField,
      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: Consumer<SearchViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return DropdownButton(
              value: value.selectedTag,
              items: value.items.map<DropdownMenuItem<String>>((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              icon: Icon(Icons.arrow_drop_down_sharp),
              onChanged: (val) {
                value.dropDownButtonOnChanges(val);
              },
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

  _buildResultAll() {
    return Visibility(
      visible: true,
      child: Column(
        children: [
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return UserTile(
                user: UserListItem(
                  username: "fayar",
                  avatar: "assets/images/dump_1.jpg",
                  isStory: true,
                  nameAndSurname: "Fatih Ayar",
                  isFollow: false,
                ),
              );
            },
          ),
          _buildShowMore(),
        ],
      ),
    );
  }

  _buildShowMore() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 15, 0),
      child: ShowMore(),
    );
  }
}
