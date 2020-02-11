import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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

  OneImage()
      : this.img =
            "http://s.s-bol.com/nl/static/images/main/noimage_226x213default.png";

  OneImage.media(img) : this.img = img;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width, child: Image.network(img));
  }
}

// ignore: must_be_immutable
class ImagesFound extends StatefulWidget {
  List<dynamic> images;
  ImagesFound(List<dynamic> imageList) : this.images = imageList;

  _ImagesFoundState createState() => _ImagesFoundState();
}

class _ImagesFoundState extends State<ImagesFound> {
  int currentImage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      color: Color(0xfCCCCCC),
      child: Stack(
        children: <Widget>[
          CarouselSlider(
            onPageChanged: (int index) {
              _updateCounter(index);
            },
            autoPlay: true,
            items: widget.images.map(
              (i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin:
                          EdgeInsets.symmetric(horizontal: 45.0, vertical: 45),
                      child: Center(child: Image.network(i['url'])),
                    );
                  },
                );
              },
            ).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 60,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.65),
                ),
                child: Center(
                  child: Text(
                    (currentImage.toString() +
                        " / " +
                        widget.images.length.toString()),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _updateCounter(int index) {
    setState(() {
      this.currentImage = index + 1;
    });
  }
}


