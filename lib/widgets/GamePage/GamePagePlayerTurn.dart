import 'package:flutter/material.dart';
import 'package:reversi/blocs/bloc_provider.dart';
import 'package:reversi/widgets/GamePage/GamePageHeaderCard.dart';
import 'package:reversi/blocs/GamePageHeaderBloc.dart';

class GamePagePlayerTurn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GamePagePlayerTurnState();
  }
}

class GamePagePlayerTurnState extends State<GamePagePlayerTurn> {
  final List<Color> colors = [Colors.blue, Colors.red];
  GamePageHeaderBloc headerBloc;

  @override
  void initState() {
    headerBloc = BlocProvider.of<GamePageHeaderBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    headerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GamePageHeaderCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Player Turn',
              style: TextStyle(color: Colors.brown.withOpacity(0.85))),
          StreamBuilder<int>(
            stream: headerBloc.turnStream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              return Container(
                decoration: BoxDecoration(
                  color: colors[snapshot.data],
                  border: Border.all(width: 1.0),
                  shape: BoxShape.circle),
                child: SizedBox(height: 24.0, width: 24.0,)
              );
            },
          )
        ],
      ),
    );
  }
}
