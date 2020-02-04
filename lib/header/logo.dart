import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: Image.asset(
        "assets/images/logo.png",
        width: MediaQuery.of(context).size.width * 0.3,
      ),
    );
  }
}
