import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// ignore: must_be_immutable
class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();

  Function(String) callback;

  SearchBar({this.callback});
}

class _SearchBarState extends State<SearchBar> {
  Color bolColor = Color(0xFF0000a4);
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  void showBarcode() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#FF0000", "Cancel", true, ScanMode.DEFAULT)
        .then((data) => handleSubmission("BARCODE" + data));
  }

  void handleSubmission(String text) {
    if (text.isEmpty || text.trim().length == 0) return;
    widget.callback(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEFF6FF),
      width: MediaQuery.of(context).size.width * 0.95,
      child: TextField(
        onSubmitted: handleSubmission,
        controller: textController,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: bolColor,
          hoverColor: bolColor,
          labelText: "Waar ben je naar op zoek?",
          labelStyle: TextStyle(
            color: bolColor,
          ),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: bolColor,
            ),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.center_focus_weak),
            color: bolColor,
            onPressed: () => showBarcode(),
          ),
        ),
      ),
    );
  }
}
