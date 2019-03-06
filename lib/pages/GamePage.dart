import 'package:flutter/material.dart';
import 'package:reversi/blocs/GamePageHeaderBloc.dart';
import 'package:reversi/widgets/GamePage/GamePageBoard.dart';
import 'package:reversi/widgets/GamePage/GamePageHeader.dart';
import 'package:reversi/widgets/GamePage/GamePageActionBar.dart';
import 'package:reversi/blocs/bloc_provider.dart';
import 'package:reversi/widgets/GamePage/GamePageFooter.dart';
class GamePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GamePageHeaderBloc>(
      bloc: GamePageHeaderBloc(),
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.yellow[100],
        body: Column(
          children: <Widget>[          
            SizedBox(child: GamePageActionBar(), height: 56.0,),
            GamePageHeader(),
            SizedBox(child: Container(), height: 24.0,),
            GamePageBoard(),
            Expanded(child: Container(),),
            SizedBox(child: GamePageFooter(),),
            Expanded(child: Container(),),
          ],
        ),
      ),
    );
  }
}
