import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ProductAvailability extends StatelessWidget {
  String availability;
  ProductAvailability(availability) : this.availability = availability;

  @override
  Widget build(BuildContext context) {
    return Text(
      availability,
      style: TextStyle(
        color: Color(0xFF01982b)
      ),
    );
  }
}