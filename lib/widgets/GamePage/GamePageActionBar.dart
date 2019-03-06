import 'package:flutter/material.dart';
import 'package:reversi/blocs/GamePageHeaderBloc.dart';
import 'package:reversi/blocs/bloc_provider.dart';

class GamePageActionBar extends StatefulWidget {

  @override
  GamePageActionBarState createState() {
    return new GamePageActionBarState();
  }
}

class GamePageActionBarState extends State<GamePageActionBar> {

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          iconSize: 24.0,
          icon: Icon(Icons.pause),
          onPressed: () {
            _onPauseClicked(context);
          },
          color: Colors.brown.withOpacity(0.4),
        ),
        IconButton(
          iconSize: 24.0,
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.brown.withOpacity(0.4),
        )
      ],
    );
  }

  _onPauseClicked(context) {
    headerBloc.pauseSink.add(1);
    showGeneralDialog(
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(curve: Curves.bounceOut, parent: animation),
          ),
          child: child,
        );
      },
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.65),
      transitionDuration: Duration(milliseconds: 750),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Center(
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0)
            ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: Colors.black, width: 2.0)
              ),
              onPressed: () {
                _onResumePressed(context);
              },
              color: Colors.blue,
              child: Container(
                height: 55.0,
                width: 150.0,
                child: Center(
                  child: Text('Resume', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300),))),
            ),
          ),
        );
      },
    );
  }

  _onResumePressed(context) {
    headerBloc.resumeSink.add(1);
    Navigator.pop(context);
  }
}
