
import 'package:bolsearcher/product/producttitle.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class Product extends StatelessWidget {
  String title, company, rating, availability;
  double price;

  Product(title, company, rating, price, availability) {
    this.title = title;
    this.company = company;
    this.rating = rating;
    this.price = price;
    this.availability = availability;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFFCCCCCC)))
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(width: 35),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,20,10.0, 10.0),
              child: Column(
                  children: <Widget>[
                    ProductTitle(title, company)
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }

}