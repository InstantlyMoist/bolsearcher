import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyProductButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Center(
          child: Text(
              "Koop dit product",
              style: TextStyle(
                color: Color(0xFF3e3e3e),
                fontWeight: FontWeight.bold
              ),
          )
      ),
      padding: EdgeInsets.all(15.0),
      splashColor: Color(0xFFcccccc),
      color: Color(0xFFffe900),
      onPressed: () {},
    );
  }
}