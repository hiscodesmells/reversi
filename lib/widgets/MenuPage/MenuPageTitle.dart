import 'package:flutter/material.dart';

class MenuPageTitle extends StatelessWidget {
  final String title;
  final String fontFamily;
  final double fontSize;
  final Color primaryColor;
  final Color secondaryColor;

  MenuPageTitle(
      {@required this.title,
      @required this.fontFamily,
      @required this.fontSize,
      @required this.primaryColor,
      @required this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: 2.0,
              left: 2.0,
              child: Text('Revers',
                  style: TextStyle(
                      color: secondaryColor,
                      fontFamily: fontFamily,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w800)),
            ),
            Text('Revers',
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: fontFamily,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w800))
          ],
        ),
        RotationTransition(
          turns: AlwaysStoppedAnimation(180 / 360),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                top: 2.0,
                left: 2.0,
                child: Text('i',
                    style: TextStyle(
                        color: secondaryColor,
                        fontFamily: fontFamily,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w800)),
              ),
              Text('i',
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: fontFamily,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w800))
            ],
          ),
        )
      ],
    );
  }
}
