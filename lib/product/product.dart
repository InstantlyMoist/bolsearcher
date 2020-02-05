import 'package:bolsearcher/product/components/product/product_availability.dart';
import 'package:bolsearcher/product/components/product/product_image.dart';
import 'package:bolsearcher/product/components/product/product_price.dart';
import 'package:bolsearcher/product/components/product/product_rating.dart';
import 'package:bolsearcher/product/components/product/product_title.dart';
import 'package:bolsearcher/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Product extends StatelessWidget {
  Map<String, dynamic> data;

  Product({this.data, this.callback});

  Function(Product product, String string) callback;

  @override
  Widget build(BuildContext context) {
    String summary = data['summary'];
    if (summary == null)
      summary = "";
    else
      summary = " | " + summary;

    String specsTag = data['specsTag'];
    if (specsTag == null) specsTag = "";

    String image;
    if (data['images'] == null)
      image =
          "http://s.s-bol.com/nl/static/images/main/noimage_226x213default.png";
    else
      image = data['images'][2]['url'];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(
                    data: data,
                    callback: (data) => callback(this, data),
                  )),
        );
      },
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Color(0xFFCCCCCC).withOpacity(0.5)))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              ProductImage(image),
              SizedBox(width: 25),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20, 10.0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProductTitle(data['title'], specsTag + summary),
                      SizedBox(height: 5),
                      ProductRating(data['rating'] / 1.0),
                      SizedBox(height: 10),
                      ProductPrice(data['offerData']['offers'][0]['price']),
                      SizedBox(height: 10),
                      ProductAvailability(data['offerData']['offers'][0]
                          ['availabilityDescription']),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
