import 'dart:convert';

import 'package:bolsearcher/product/components/product/product_price.dart';
import 'package:bolsearcher/product/components/product_screen/images/product_images.dart';
import 'package:bolsearcher/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RelatedProduct extends StatelessWidget {
  Map<String, dynamic> data;

  RelatedProduct({this.data});

  void openNewScreen(BuildContext context) async {
    final response = await http.get(
        "https://api.bol.com/catalog/v4/search/?apikey=25C4742A92BF468EB2BD888FC8FBFF40&format=json&limit=100&q=" +
            data['id']);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> product
          in json.decode(response.body)['products']) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(
                      data: product,
                      callback: null,
                    )));
      }
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openNewScreen(context),
      child: Container(
        margin: EdgeInsets.only(right: 25),
        height: 285,
        width: 155,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(
                2.0,
                2.0,
              ),
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            Image.network(data['images'][2]['url']),
            Container(
              margin: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data['specsTag'],
                    style: TextStyle(fontSize: 16),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    data['title'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  ProductPrice(19.75),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
