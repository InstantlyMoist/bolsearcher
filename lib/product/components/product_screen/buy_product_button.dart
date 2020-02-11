import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class BuyProductButton extends StatelessWidget {

  String url;

  BuyProductButton(this.url);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              color: Color(0xFF000000),
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              "Koop dit product",
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        splashColor: Color(0xFFcccccc).withOpacity(0.2),
        color: Color(0xFFffcd02),
        onPressed: () {
          _launchURL();
        }
    );

  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}