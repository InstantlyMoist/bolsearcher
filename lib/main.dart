import 'package:bolsearcher/components/logo.dart';
import 'package:bolsearcher/components/searchbar.dart';
import 'package:bolsearcher/product/product.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: "HomePage",),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipRRect (
          borderRadius: BorderRadius.circular(0),
         child: Container(
           width: MediaQuery.of(context).size.width,
           color: Colors.white,
           child: Column (
             children: <Widget>[
               Logo(),
               SearchBar(),
               Product("Product","Happy Socks", "5", 50.0, "yes")
             ],
           ),
         ),
        ),
      ),
    );
  }
}
