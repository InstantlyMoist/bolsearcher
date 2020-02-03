import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container (
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.95,
      height: 45,
      child: TextField (
        decoration: InputDecoration (
          labelText: "Waar ben je naar op zoek?",
        ),
      ),
    );
  }
}