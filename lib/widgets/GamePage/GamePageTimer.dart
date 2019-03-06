import 'package:flutter/material.dart';
import 'package:reversi/blocs/GamePageHeaderBloc.dart';
import 'package:reversi/blocs/bloc_provider.dart';
import 'package:reversi/widgets/GamePage/GamePageHeaderCard.dart';

class GamePageTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GamePageTimerState();
  }
}

class GamePageTimerState extends State<GamePageTimer> with TickerProviderStateMixin{

  GamePageHeaderBloc headerBloc;
  AnimationController _controller;
  Tween<double> tween;

  @override
  void initState() {
    headerBloc = BlocProvider.of<GamePageHeaderBloc>(context);
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    tween = Tween(begin: 0.2, end: 1.0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GamePageHeaderCard(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text('Time',
            style: TextStyle(color: Colors.brown.withOpacity(0.85))),
        StreamBuilder<int>(
          stream: headerBloc.timeStream,
          initialData: 30,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if(snapshot.data > 5){
          return Text('0:' + snapshot.data.toString(),
          style:
              TextStyle(fontSize: 24.0, color: Colors.brown.withOpacity(0.85)));
        }
        else{
          _controller.reset();
          _controller.forward();
          return ScaleTransition(
            scale: tween.animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut)),
            child: Text('0:' + snapshot.data.toString(),
          style:
              TextStyle(fontSize: 24.0, color: Colors.brown.withOpacity(0.85)))
          );
        }}
        )
      ],
    ),
    );
  }

}
