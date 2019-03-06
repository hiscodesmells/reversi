import 'package:flutter/material.dart';
import 'package:reversi/blocs/GamePageHeaderBloc.dart';
import 'package:reversi/blocs/bloc_provider.dart';

class GamePageScoreCardText extends StatefulWidget {
  final int index;

  GamePageScoreCardText({@required this.index});

  @override
  State<StatefulWidget> createState() {
    return GamePageScoreCardTextState();
  }
}

class GamePageScoreCardTextState extends State<GamePageScoreCardText>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> tween;
  GamePageHeaderBloc headerBloc;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    tween = Tween(begin: 1.3, end: 1.0);
    headerBloc = BlocProvider.of<GamePageHeaderBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: headerBloc.scoreStream,
      initialData: [2, 2],
      builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
        var text = (snapshot.data[widget.index] < 10)
            ? '0' + snapshot.data[widget.index].toString()
            : snapshot.data[widget.index].toString();
        _controller.reset();
        _controller.forward();
        return ScaleTransition(
          scale: tween.animate(
              CurvedAnimation(curve: Curves.decelerate, parent: _controller)),
          child: Text(text,
              style: TextStyle(
                  fontSize: 15.0, color: Colors.brown.withOpacity(0.85))),
        );
      },
    );
  }
}
