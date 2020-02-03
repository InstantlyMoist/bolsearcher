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
          SizedBox(width: 8,),
          Icon(
            Icons.sort,
            color: Colors.white,
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