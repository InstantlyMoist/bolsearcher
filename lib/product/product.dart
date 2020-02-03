import 'package:bolsearcher/product/productimage.dart';
import 'package:bolsearcher/product/productprice.dart';
import 'package:bolsearcher/product/producttitle.dart';
import 'package:bolsearcher/product/productrating.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class Product extends StatelessWidget {
  int rating;
  String title, company, availability, url;
  double price;

  Product({
    this.title,
    this.company,
    this.rating,
    this.availability,
    this.price,
    this.url
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Color(0xFFCCCCCC)))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            ProductImage(url),
            SizedBox(width: 25),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20, 10.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ProductTitle(title, company),
                    SizedBox(height: 5),
                    ProductRating(rating / 1.0),
                    SizedBox(height: 10),
                    ProductPrice(50.0)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
