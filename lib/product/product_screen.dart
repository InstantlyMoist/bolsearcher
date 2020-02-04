import 'package:bolsearcher/product/components/product/product_availability.dart';
import 'package:bolsearcher/product/components/product/product_price.dart';
import 'package:bolsearcher/product/components/product/product_rating.dart';
import 'package:bolsearcher/product/components/product/product_title.dart';
import 'package:bolsearcher/product/components/product_screen/product_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/product_screen/buy_product_button.dart';
import 'components/product_screen/product_images.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  Map<String, dynamic> data;
  ProductScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ProductImages(data['media']),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: FlatButton(
                          child: Icon(Icons.arrow_back),
                          onPressed: () {Navigator.pop(context);},
                        ),
                      ),
                    ]
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ProductPrice(data['offerData']['offers'][0]['price']),
                          SizedBox(height: 10),
                          ProductTitle(data['title'], data['specsTag'] + " | " + data['summary']),
                          SizedBox(height: 10),
                          ProductRating(data['rating'] / 1.0),
                          SizedBox(height: 15),
                          ProductAvailability(data['offerData']['offers'][0]['availabilityDescription']),
                          SizedBox(height: 20),
                          ProductDescription(data['longDescription']),
                          SizedBox(height: 30),
                          BuyProductButton()
                        ],
                      )
                  ),
              ],
            ),
          ),
      ),
    );
  }
}