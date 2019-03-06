import 'package:flutter/material.dart';
import 'package:reversi/widgets/GamePage/GamePageHeaderCard.dart';
import 'package:reversi/widgets/GamePage/GamePageScoreCardText.dart';

class GamePageScore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GamePageScoreState();
  }
}

class GamePageScoreState extends State<GamePageScore> {
  @override
  Widget build(BuildContext context) {
    return GamePageHeaderCard(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Score',
                style: TextStyle(color: Colors.brown.withOpacity(0.85))),
            Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(width: 1.0),
                    shape: BoxShape.circle),
                child: SizedBox(
                  height: 12.0,
                  width: 12.0,
                ),
              ),
              Text(' - '),
              GamePageScoreCardText(index: 0)
            ],
          ),
          SizedBox(
            height: 6.0,
            width: double.infinity,
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(width: 1.0),
                    shape: BoxShape.circle),
                child: SizedBox(
                  height: 12.0,
                  width: 12.0,
                ),
              ),
              Text(' - '),
              GamePageScoreCardText(index: 1)
            ],
          )
        ],
      )
          ],
        ),
    );
  }
}
