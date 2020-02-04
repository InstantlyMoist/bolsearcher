import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterPopup extends StatefulWidget {
  @override
  _FilterPopupState createState() => _FilterPopupState();

  VoidCallback callback;

  FilterPopup({this.callback});

}

class _FilterPopupState extends State<FilterPopup> {
  SharedPreferences prefs;
  static String selectedFilter;

  List<FilterItem> filterItems = <FilterItem>[
    FilterItem("Relevantie", "rankasc", "rankasc" == selectedFilter),
    FilterItem("Populariteit", "rankdesc", "rankdesc" == selectedFilter),
    FilterItem("Prijs laag - hoog", "priceasc", "priceasc" == selectedFilter),
    FilterItem("Prijs hoog - laag", "pricedesc", "pricedesc" == selectedFilter),
    FilterItem("Verschijningsdatum", "datedesc", "datedesc" == selectedFilter),
    FilterItem("Beoordeling", "ratingdesc", "ratingdesc" == selectedFilter),
  ];

  void select(FilterItem item, BuildContext context) async{
    filterItems.forEach((loopItem) {
      if (item != loopItem) loopItem.selected = false;
    });
    await prefs.setString('filter', item.filterName);
    selectedFilter = item.filterName;
    setState(() {
      item.selected = true;
    });
    Navigator.pop(context);
    widget.callback();
  }

  @override
  void initState() {
    super.initState();
    loadFilters();
  }

  void loadFilters() async {
    prefs = await SharedPreferences.getInstance();
    selectedFilter = prefs.getString("filter");
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: Color(0xFF0000a4),
              ),
              height: 48,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Sorteren op",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    itemCount: filterItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          select(filterItems[index], context);
                        },
                        child: Container(
                          color: filterItems[index].selected
                              ? Color(0xFFF4F4F4)
                              : Colors.white,
                          height: 75,
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20,),
                              Text(filterItems[index].displayName),
                            ],
                          ),
                        ),
                      );
                    }),

                /*children: List.generate(filterItems.length, (index) {
                    return ListTile(
                      selected: filterItems[index].selected,
                      leading:
                      title: Text('ID: ' + filterItems[index].displayName.toString()),
                      subtitle: Text(filterItems[index].displayName),
                      trailing: (filterItems[index].selected) ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
                    );
                  }),
                ),*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterItem {
  final String displayName;
  final String filterName;

  bool selected = false;

  FilterItem(this.displayName, this.filterName, this.selected);
}
