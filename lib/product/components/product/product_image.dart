import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ProductImage extends StatelessWidget {
  String url;
  ProductImage(url) : this.url = url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 95,
      child: Image.network(url)
    );
  }
}