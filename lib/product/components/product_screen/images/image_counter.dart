import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageCounter extends StatelessWidget {

  String currentIndex, totalImages;
  ImageCounter(String index, String total) : this.currentIndex = index, this.totalImages = total;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              (currentIndex +
                  " / " +
                  totalImages),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}