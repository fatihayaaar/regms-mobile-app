import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/app_bar/appbar_search.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';
import 'package:regms_flutter_client/widgets/page.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State {
  String _selectedTag = "Global Trend Topic";
  var items = [
    'Global Trend Topic',
    'Turkey Trend Topic',
    'Local Trend Topic',
  ];
  var isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearchWidget(
        searchOnChanged: (value) {
          _searchOnChange(value);
        },
      ),
      body: PageWidget(child: _buildContent()),
      bottomNavigationBar: BottomNavBar(selected: -2, context: context),
    );
  }

  _buildContent() {
    switch (isSearch) {
      case false:
        return _buildTrendTopic();
      case true:
        return _buildSearchResult();
    }
  }

  _buildSearchResult() {
    return Column(
      children: [
        Container(
          height: 30,
          margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildListTypeItem("User"),
              SizedBox(width: 10),
              _buildListTypeItem("Group"),
              SizedBox(width: 10),
              _buildListTypeItem("Post"),
              SizedBox(width: 10),
              _buildListTypeItem("Tags"),
            ],
          ),
        ),
      ],
    );
  }

  _buildListTypeItem(value) {
    return Container(
      width: 75,
      decoration: kBoxDecorationListTypeItem,
      alignment: Alignment.center,
      child: Text(value, style: kListTypeItemTextStyle),
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
                    color: kBorderColor.withOpacity(0.5),
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
        child: DropdownButton(
          value: _selectedTag,
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          icon: Icon(Icons.arrow_drop_down_sharp),
          onChanged: (String? value) {
            setState(() {
              _selectedTag = value!;
            });
          },
          isExpanded: true,
          underline: Container(),
          style: kLabelTextStyle,
          elevation: 1,
        ),
      ),
    );
  }

  _searchOnChange(value) {
    if (value == null) {
      setState(() {
        this.isSearch = false;
      });
      return;
    }

    if (value == "") {
      setState(() {
        this.isSearch = false;
      });
    } else {
      setState(() {
        this.isSearch = true;
      });
    }
  }
}
