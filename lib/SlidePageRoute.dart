import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget child;

  SlidePageRoute({@required this.child})
  :super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
        return child;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,
        Widget child){
          return SlideTransition(
            child: child,
            position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(
              CurvedAnimation(curve: Curves.bounceOut, parent: animation, reverseCurve: Curves.fastOutSlowIn)
            ),
          );
      },
      transitionDuration: Duration(seconds: 1)
    );

}