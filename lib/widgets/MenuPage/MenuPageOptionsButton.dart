import 'package:flutter/material.dart';

class MenuPageOptionsButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color fillColor;
  final Color textColor;
  final double height;
  final Color borderColor;
  final double textSize;

  MenuPageOptionsButton(
      {@required this.text,
      @required this.onPressed,
      this.fillColor = Colors.blue,
      this.textColor = Colors.white,
      this.height = 55.0,
      this.borderColor = Colors.black,
      this.textSize = 18.0});

  @override
  State<StatefulWidget> createState() {
    return MenuPageOptionsButtonState();
  }
}

class MenuPageOptionsButtonState extends State<MenuPageOptionsButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.blue[800],
      onPressed: widget.onPressed,
      color: widget.fillColor,
      child: Container(
          height: widget.height,
          child: Center(
              child: Text(
            widget.text,
            style: TextStyle(color: widget.textColor, 
              fontSize: widget.textSize, 
              fontWeight: FontWeight.w300),
          ))),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.height),
          side: BorderSide(color: widget.borderColor, width: 2.0)),
    );
  }
}
