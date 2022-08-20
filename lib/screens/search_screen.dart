import 'package:flutter/material.dart';
import 'package:regms_flutter_client/constants/colors.dart';
import 'package:regms_flutter_client/constants/styles.dart';
import 'package:regms_flutter_client/widgets/app_bar/appbar_search.dart';
import 'package:regms_flutter_client/widgets/bottom_navbar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearchWidget(),
      body: _buildBody(),
      bottomNavigationBar: BottomNavBar(selected: -2),
    );
  }

  _buildBody() {
    return Stack(
      children: [
        Container(
          height: 30,
          color: kAppbarColor,
        ),
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          child: _buildContent(),
        ),
      ],
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
          color: kThemeColor,
          child: Column(
            children: [
              SizedBox(height: 15),
              _buildFilter(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 15,
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
          ),
        ),
      ),
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
}
