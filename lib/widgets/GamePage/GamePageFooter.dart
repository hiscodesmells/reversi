import 'package:flutter/material.dart';
import 'package:reversi/blocs/GamePageFooterBloc.dart';
import 'package:reversi/blocs/bloc_provider.dart';
import 'package:reversi/widgets/GamePage/GamePageFooterText.dart';

class GamePageFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GamePageFooterBloc>(
      bloc: GamePageFooterBloc(),
      child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
            GamePageFooterText(index: 0),
            GamePageFooterText(index: 1),
            ]
          ),
      height: 60.0,
      width: 300.0,
      decoration: BoxDecoration(
          color: Colors.brown[300].withOpacity(0.5),
          border: Border.all(width: 2.0, color: Colors.brown),
          borderRadius: BorderRadius.circular(8.0)
        ),
      ),
    );
  }
}


