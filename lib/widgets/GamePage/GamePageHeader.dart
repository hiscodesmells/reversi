import 'package:flutter/material.dart';
import 'package:reversi/widgets/GamePage/GamePageScoreCard.dart';
import 'package:reversi/widgets/GamePage/GamePageTimer.dart';
import 'package:reversi/widgets/GamePage/GamePagePlayerTurn.dart';
class GamePageHeader extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GamePageScore(),
            GamePageTimer(),
            GamePagePlayerTurn(),
          ],
        ),
      );
    }
}