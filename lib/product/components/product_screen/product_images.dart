import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  ProductImages(data);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: 375.0,
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network("https://s.s-bol.com/imgbase0/imagebase3/large/FC/1/8/3/5/9200000093155381.jpg",);
          },
        );
      }).toList(),
    );
  }

}