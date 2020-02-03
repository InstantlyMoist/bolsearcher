import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  Color bolColor = Color(0xFF0000a4);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEFF6FF),
      width: MediaQuery.of(context).size.width * 0.95,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: bolColor,
          hoverColor: bolColor,
          labelText: "Waar ben je naar op zoek?",
          labelStyle: TextStyle (
            color: bolColor,
          ),
          prefixIcon: Icon(Icons.search, color: bolColor,),
          suffixIcon: IconButton(
            icon: Icon(Icons.center_focus_weak),
            color: bolColor,
            onPressed: () => print('pressed'),
          ),
        ),
      ),
    );
  }
}
