import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:reversi/SlidePageRoute.dart';
import 'package:reversi/pages/InstructionsPage.dart';
import 'package:reversi/widgets/MenuPage/MenuPageOptionsButton.dart';
import 'package:reversi/pages/GamePage.dart';
import 'package:video_player/video_player.dart';

class MenuPageOptions extends StatefulWidget {
  @override
  MenuPageOptionsState createState() {
    return new MenuPageOptionsState();
  }
}

class MenuPageOptionsState extends State<MenuPageOptions> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MenuPageOptionsButton(
          text: 'Dual Player Mode',
          onPressed: () {
            Navigator.push(context, SlidePageRoute(child: GamePage()));
          },
        ),
        SizedBox(
          height: 15,
        ),
        MenuPageOptionsButton(
          text: 'Single Player Mode',
          onPressed: () {},
        ),
        SizedBox(
          height: 15,
        ),
        MenuPageOptionsButton(
          text: 'Instructions',
          onPressed: () {
            Navigator.push(context, SlidePageRoute(child: InstructionsPage()));
          },
        ),
      ],
    );
  }
}
