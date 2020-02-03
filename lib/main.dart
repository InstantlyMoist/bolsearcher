import 'dart:convert';

import 'package:bolsearcher/product/product.dart';
import 'package:http/http.dart' as http;

import 'package:bolsearcher/components/logo.dart';
import 'package:bolsearcher/components/searchbar.dart';
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
  int state = 0;

  String url =
      "https://api.bol.com/catalog/v4/search/?apikey=25C4742A92BF468EB2BD888FC8FBFF40&format=json&q=";

  List<Product> products = new List();

  Future<http.Response> fetchPost(String text) async {
    products = new List();
    final response = await http.get(url + text);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> product
          in json.decode(response.body)['products']) {
        products.add(Product(
          title: product['title'],
          rating: product['rating'],
          price: 12.3,
          company: product['specsTag'] + " | " + product['summary'],
          availability: "12",
        ));
      }
      setState(() {
        products;
      });
    } else {
      //TODO: Give front-end response
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipRRect(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Logo(),
                SearchBar(callback: fetchPost),
                Expanded(
                  child: SizedBox(
                    child: products.isEmpty ? Text("empty") : ListView.builder(
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
    );
  }
}
