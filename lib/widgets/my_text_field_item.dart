import "package:flutter/material.dart";

class MyTextFieldItem extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  MyTextFieldItem({
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  _MyTextFieldItemState createState() => _MyTextFieldItemState();
}

class _MyTextFieldItemState extends State<MyTextFieldItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        autofocus: false,
        style: TextStyle(fontSize: 25, fontFamily: "Bodini"),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: "AgencyFB",
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
