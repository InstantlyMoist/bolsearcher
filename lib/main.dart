import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bolsearcher/components/logo.dart';
import 'package:bolsearcher/components/searchbar.dart';
import 'package:bolsearcher/product/product.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        title: "HomePage",
      ),
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
      "https://api.bol.com/catalog/v4/search/?apikey=25C4742A92BF468EB2BD888FC8FBFF40&format=json&q=";

  Future<http.Response> fetchPost(String text) async {
    final response = await http.get(url + text);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> product
          in json.decode(response.body)['products']) {
        print(product['ean']);
      }
    } else {
      //TODO: Give front-end response
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipRRect (
          borderRadius: BorderRadius.circular(0),
         child: Container(
           width: MediaQuery.of(context).size.width,
           color: Colors.white,
           child: Column (
             children: <Widget>[
               Logo(),
               SearchBar(),
               Product("Product","Happy Socks", "5", 50.0, "yes")
             ],
           ),
         ),
        child: ClipRRect(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Logo(),
                SearchBar(callback: fetchPost),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
