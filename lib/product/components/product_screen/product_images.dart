import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  List<dynamic> images;
  ProductImages(images) : this.images = images;

  @override
  Widget build(BuildContext context) {
    if (images == null) {
        return OneImage();
    } else if (images.length == 1) {
       return OneImage.media(images[0]['url']);
    } else {
      return ImagesFound(images);
    }
  }
}

// ignore: must_be_immutable
class OneImage extends StatelessWidget {
  String img;

  OneImage() : this.img = "http://s.s-bol.com/nl/static/images/main/noimage_226x213default.png";
  OneImage.media(img) : this.img = img;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Image.network(img)
    );
  }
}

// ignore: must_be_immutable
class ImagesFound extends StatelessWidget{
  List<dynamic> images;
  ImagesFound(images) : this.images = images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      autoPlay: true,
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
    );;
  }
}

