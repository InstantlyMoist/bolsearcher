import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ProductPrice extends StatelessWidget {

  double price;
  ProductPrice(price) : this.price = price;

  @override
  Widget build(BuildContext context) {
    List<String> split = price.toString().replaceAll(".", ",").split(",");
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              split[0],
              style: TextStyle(
                color: Color(0xFFFF4947),
                fontSize: 26,
                fontWeight: FontWeight.w900
              ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text (
                  split[1] == "0" ? "-" : split[1],
                  style: TextStyle(
                      color: Color(0xFFFF4947),
                      fontSize: 16,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Text (
                ",",
                style: TextStyle(
                    height: 0.05,
                    color: Color(0xFFFF4947),
                    fontSize: 24,
                    fontWeight: FontWeight.w900
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}