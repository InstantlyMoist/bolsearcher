import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class ProductRating extends StatelessWidget {
  double rating;
  ProductRating(double rating) : this.rating = rating / 10;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: 20,
      initialRating: rating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }
}