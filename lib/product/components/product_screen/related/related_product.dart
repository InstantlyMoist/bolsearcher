import 'package:bolsearcher/product/components/product/product_price.dart';
import 'package:bolsearcher/product/components/product_screen/images/product_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RelatedProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          ProductImages(null),
          Container(
            margin: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Durcaell",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Durcal Ultra Power AAA",
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
    );
  }
}
