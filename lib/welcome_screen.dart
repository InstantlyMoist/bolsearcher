import 'package:flutter/cupertino.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/bol_mascotte.png",
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Welkom bij de bol.com browser",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Voer een zoekopdracht in om van start te gaan",
            style: TextStyle(fontSize: 16,),
          )
        ],
      ),
    );
  }
}
