import 'dart:convert';

import 'package:bolsearcher/product/product.dart';
import 'package:bolsearcher/product/product_screen.dart';
import 'package:bolsearcher/welcome_screen.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'header/logo.dart';
import 'header/options/filter_button.dart';
import 'header/options/filter_popup.dart';
import 'header/searchbar.dart';

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
  String url =
      "https://api.bol.com/catalog/v4/search/?apikey=25C4742A92BF468EB2BD888FC8FBFF40&format=json&limit=100&q=";

  List<Product> products = new List();

  String lastSearchQuery;

  void handleRefresh() {
    if (lastSearchQuery == null) return;
    fetchPost(lastSearchQuery);
  }

  Future<http.Response> fetchPost(String text) async {
    products = new List();
    bool barcode = false;
    if (text.startsWith("BARCODE")) {
      barcode = true;
      text = text.replaceAll("BARCODE", "");
    }
    lastSearchQuery = text;
    setState(() {
      main = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(width: 50, height: 50, child: CircularProgressIndicator()),
        ],
      );
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response =
        await http.get(url + text + "&sort=" + prefs.getString("filter"));
    if (response.statusCode == 200) {
      bool hasProducts = json.decode(response.body)['products'] != null;
      if (!hasProducts) {
        main = WelcomeScreen();
        print("found none");
        return null;
      }
      for (Map<String, dynamic> product
          in json.decode(response.body)['products']) {
        if (barcode) {
          main = WelcomeScreen();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(
                      data: product,
                      callback: null,
                    )),
          );
          break;
        }
        products.add(Product(
          data: product,
          callback: (product, string) => test(product, string),
        ));
      }
      setState(() {
        products;
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  int currentIndex = 0;

  int getNewIndex(String direction) {
    int newIndex = currentIndex += direction == "left" ? 1 : -1;
    currentIndex = newIndex;
    return newIndex;
  }

  void test(Product product, String answer) {
    if (answer == 'none') return;
    currentIndex = products.indexOf(product);
    getNewIndex(answer);
    if (currentIndex < 0) currentIndex = 0;
    nextIndex(currentIndex, answer);
  }

  void nextIndex(int index, String answer) {
    if (answer == 'none') return;
    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(
          data: products[currentIndex].data,
          callback: (data) {
            this.getNewIndex(data);
            if (currentIndex < 0) currentIndex = 0;
            this.nextIndex(currentIndex, data);
          },
        ),
      ),
    );
  }

  Widget main = WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                            showDialog(
                                context: context,
                                child: FilterPopup(
                                  callback: handleRefresh,
                                ));
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
