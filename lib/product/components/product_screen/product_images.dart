import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  List<dynamic> images;
  ProductImages(images) : this.images = images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: 375.0,
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 45.0),
              child: Image.network(i['url'])
            );
          },
        );
      }).toList(),
    );
  }
}