import 'dart:convert';

import 'package:bolsearcher/product/components/product_screen/related/related_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


// ignore: must_be_immutable
class RelatedProducts extends StatefulWidget {
  String productId, company, title, price;

  RelatedProducts(String id) : this.productId = id;

  @override
  _RelatedProductsState createState() => _RelatedProductsState();
}

class _RelatedProductsState extends State<RelatedProducts> {
  String url;

  List<RelatedProduct> products = new List();

  @override
  void initState() {
    url = "https://api.bol.com/catalog/v4/recommendations/" +
        widget.productId +
        "/?apikey=25C4742A92BF468EB2BD888FC8FBFF40&format=json";

    fetchProducts();
  }

  void fetchProducts() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> product
      in json.decode(response.body)['products']) {
        products.add(RelatedProduct(
          data: product,
        ));
      }
      setState(() {
        products;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Bijpassende artikelen",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 285,
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: products.isEmpty
                      ? Container()
                      : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return products[index];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
