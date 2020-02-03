import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {

  VoidCallback callback;

  FilterButton({this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.sort,
            color: Colors.white,
            size: 16,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "Sorteren",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}