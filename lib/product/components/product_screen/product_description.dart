import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

// ignore: must_be_immutable
class ProductDescription extends StatelessWidget {
  String description;
  ProductDescription(description) : this.description = description;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
        description
    );
  }
}