import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ProductPrice extends StatelessWidget {
  double price;
  ProductPrice(price) : this.price = price;

  @override
  Widget build(BuildContext context) {
    return Text(
        price.toString().replaceAll(".",","),
        style: TextStyle(
          color: Color(0xFFFF4947),
          fontSize: 26,
          fontWeight: FontWeight.w900
        ),
    );
  }

}