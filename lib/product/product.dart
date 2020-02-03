
import 'package:bolsearcher/product/productimage.dart';
import 'package:bolsearcher/product/producttitle.dart';
import 'package:bolsearcher/product/rating.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class Product extends StatelessWidget {
  int rating;
  String title, company, availability;
  double price;


  Product({this.title, this.company, this.rating, this.availability, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFCCCCCC)))
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            ProductImage("https://s.s-bol.com/imgbase0/imagebase3/mini/FC/2/3/7/0/9200000089180732.jpg"),
            SizedBox(width: 20),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0,20,10.0, 10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProductTitle(title, company),
                      SizedBox(height: 10),
                      Rating(rating / 10.0),
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