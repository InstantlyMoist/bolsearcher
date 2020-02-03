import 'dart:convert';

import 'package:bolsearcher/components/filter_button.dart';
import 'package:bolsearcher/components/filter_popup.dart';
import 'package:bolsearcher/product/product.dart';
import 'package:http/http.dart' as http;

import 'package:bolsearcher/components/logo.dart';
import 'package:bolsearcher/components/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        title: "HomePage",
      ),
      theme: ThemeData(fontFamily: 'OpenSans'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int state = 0;

  String url =
      "https://api.bol.com/catalog/v4/search/?apikey=25C4742A92BF468EB2BD888FC8FBFF40&format=json&q=";

  List<Product> products = new List();

  String lastSearchQuery;

  void handleRefresh() {
    if (lastSearchQuery == null) return;
    fetchPost(lastSearchQuery);
  }

  Future<http.Response> fetchPost(String text) async {
    products = new List();
    lastSearchQuery = text;
    setState(() {
      main = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(width: 50, height: 50,child: CircularProgressIndicator()),
        ],
      );
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(url + text + "&sort=" + prefs.getString("filter"));
    if (response.statusCode == 200) {
      for (Map<String, dynamic> product in json.decode(response.body)['products']) {
        products.add(Product(product));
      }
      setState(() {
        products;
      });
    } else {
      //TODO: Give front-end response
      throw Exception('Failed to load post');
    }
  }

  Widget main = new Text("Nothing to show!");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Logo(),
                  SearchBar(callback: fetchPost),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.95,
                    color: Color(0xFF0000a4),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 18,
                        ),
                        FilterButton(
                          callback: () {
                            showDialog(context: context, child: FilterPopup(callback: handleRefresh,));
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: products.isEmpty
                          ? main
                          : ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return products[index];
                              }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
