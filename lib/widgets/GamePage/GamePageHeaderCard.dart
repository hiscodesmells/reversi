import 'package:flutter/material.dart';

class GamePageHeaderCard extends StatelessWidget {

  final Widget child;

  const GamePageHeaderCard({Key key, @required this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.0,
      width: 90.0,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border.all(width: 2.0, color: Colors.brown),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.brown[300].withOpacity(0.5)
          ),
        child: child,
        ),
      );
  }
}