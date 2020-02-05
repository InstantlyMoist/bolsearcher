import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
              color: Color(0xFF3e3e3e),
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              "Koop dit product",
              style: TextStyle(
                  color: Color(0xFF3e3e3e),
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        splashColor: Color(0xFFcccccc).withOpacity(0.3),
        color: Color(0xFFffe900),
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