import "package:flutter/material.dart";

class MyFlatButton extends StatelessWidget {
  final String title;
  final Function handler;
  final Color color;
  final double height;
  final double width;
  final double circularDegree;

  MyFlatButton({
    @required this.title,
    @required this.handler,
    this.color = Colors.blue,
    this.height,
    this.width,
    this.circularDegree = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(circularDegree),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset.fromDirection(0.6, height / 6),
            blurRadius: 6,
          ),
        ],
      ),
      child: FlatButton(
        child: FittedBox(
          child: Text(
            title,
            style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularDegree),
        ),
        color: color,
        onPressed: handler,
      ),
    );
  }
}
