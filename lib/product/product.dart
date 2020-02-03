import 'package:bolsearcher/product/components/product_availability.dart';
import 'package:bolsearcher/product/components/product_image.dart';
import 'package:bolsearcher/product/components/product_price.dart';
import 'package:bolsearcher/product/components/product_title.dart';
import 'package:flutter/cupertino.dart';

import 'components/product_rating.dart';

// ignore: must_be_immutable
class Product extends StatelessWidget {
  Map<String, dynamic> data;

  Product(this.data);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: Color(0xFFCCCCCC)))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              ProductImage(data['images'][2]['url']),
              SizedBox(width: 25),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20, 10.0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ProductTitle(data['title'],
                          data['specsTag'] + " | " + data['summary']),
                      SizedBox(height: 5),
                      ProductRating(data['rating'] / 1.0),
                      SizedBox(height: 10),
                      ProductPrice(data['offerData']['offers'][0]['price']),
                      SizedBox(
                        height: 10,
                      ),
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
