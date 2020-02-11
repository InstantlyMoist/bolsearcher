import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ProductTitle extends StatelessWidget {
  String title, company;
  ProductTitle(title, company)
      : this.title = title,
        this.company = company;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          maxLines: 3,
        ),
        SizedBox(height: 5),
        Text(
          company,
          style: TextStyle(color: Color(0xFF828282)),
          maxLines: 2,
        ),
      ],
    );
  }
}
