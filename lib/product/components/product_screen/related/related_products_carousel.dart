import 'package:bolsearcher/product/components/product_screen/related/related_product.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class RelatedProducts extends StatelessWidget {

  RelatedProducts(String id) : this.productId = id;
  String productId, company, title, price;

  @override
  Widget build(BuildContext context) {
    String url = "https://api.bol.com/catalog/v4/recommendations/" + productId + "/?apikey=25C4742A92BF468EB2BD888FC8FBFF40&format=json&limit=2";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Bijpassende artikelen",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: <Widget>[
            RelatedProduct(),
          ],
        )
      ],
    );
  }
}
