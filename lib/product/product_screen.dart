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
  Function(String string) callback;
  ProductScreen({this.data, this.callback});

  @override
  Widget build(BuildContext context) {
    String summary = data['summary'];
    if (summary == null) summary = "";
    else summary = " | " + summary;

    String specsTag = data['specsTag'];
    if (specsTag == null) specsTag = "";

    void _onHorizontalDrag(DragEndDetails details) {
      if(details.primaryVelocity == 0) {
        callback("none");
       return;
      } // user have just tapped on screen (no dragging)

      if (details.primaryVelocity.compareTo(0) == -1)
        callback("left");
      else
        callback("right");
    }

    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) => _onHorizontalDrag(details),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ProductImages(data['media']),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          margin: EdgeInsets.only(top: 20, left: 10),
                          child: FlatButton(
                            padding: EdgeInsets.only(left: 0),
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
                            ProductTitle(data['title'], specsTag + summary),
                            SizedBox(height: 10),
                            ProductRating(data['rating'] / 1.0),
                            SizedBox(height: 15),
                            ProductAvailability(data['offerData']['offers'][0]['availabilityDescription']),
                            SizedBox(height: 20),
                            ProductDescription(data['longDescription']),
                            SizedBox(height: 30),
                            BuyProductButton(data['urls'][0]['value'])
                          ],
                        )
                    ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}