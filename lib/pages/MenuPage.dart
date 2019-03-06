import 'package:flutter/material.dart';
import 'package:reversi/blocs/bloc_provider.dart';
import 'package:reversi/widgets/MenuPage/MenuPageBackgroundAnimation.dart';
import 'package:reversi/widgets/MenuPage/MenuPageTitle.dart';
import 'package:reversi/widgets/MenuPage/MenuPageOptions.dart';
import 'package:reversi/Constants.dart';
import 'package:reversi/blocs/AnimatedDotBloc.dart';

class MenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: BlocProvider<AnimatedDotBloc>(
        bloc: AnimatedDotBloc(),
        child: Stack(
          children: <Widget>[
            MenuPageBackgroundAnimation(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Container()),
                  MenuPageTitle(
                    title: title,
                    fontSize: titleFontSize,
                    fontFamily: titleFontFamily,
                    primaryColor: primaryTitleColor,
                    secondaryColor: secondaryTitleColor,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  MenuPageOptions(),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
