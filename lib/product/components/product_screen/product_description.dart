import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ProductDescription extends StatelessWidget {
  String description;
  ProductDescription(description) : this.description = description;

  @override
  Widget build(BuildContext context) {
    return Text(
        description
    );
  }
}