import 'package:flutter/material.dart';
import 'package:reversi/blocs/GamePageHeaderBloc.dart';
import 'package:reversi/blocs/bloc_provider.dart';
import 'package:reversi/SlidePageRoute.dart';
import 'package:reversi/pages/GamePage.dart';
class GamePageGameOverDialog extends StatefulWidget {
  final String blueResult;
  final String redResult;

  const GamePageGameOverDialog(
      {Key key, @required this.blueResult, @required this.redResult})
      : super(key: key);

  @override
  GamePageGameOverDialogState createState() {
    return new GamePageGameOverDialogState();
  }
}

class GamePageGameOverDialogState extends State<GamePageGameOverDialog> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(8.0),
        child: Material(
          type: MaterialType.transparency,
          child: SizedBox(
            height: 150.0,
            width: 250.0,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.brown),
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Game Over!',
                      style: TextStyle(
                          color: Colors.brown.withOpacity(0.85),
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          width: 75.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(width: 1.0),
                                    shape: BoxShape.circle),
                                child: SizedBox(
                                  height: 16.0,
                                  width: 16.0,
                                ),
                              ),
                              Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.brown.withOpacity(0.85)),
                              ),
                              Text(
                                widget.blueResult,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.brown.withOpacity(0.85)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 75.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(width: 1.0),
                                    shape: BoxShape.circle),
                                child: SizedBox(
                                  height: 16.0,
                                  width: 16.0,
                                ),
                              ),
                              Text(
                                '-',
                                style: TextStyle(
                                    color: Colors.brown.withOpacity(0.85)),
                              ),
                              Text(
                                widget.redResult,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.brown.withOpacity(0.85)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          elevation: 0.0,
                          splashColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side:
                                  BorderSide(width: 1.5, color: Colors.black)),
                          onPressed: () {
                            _onNewGamePressed();
                          },
                          color: Colors.red,
                          child: Text(
                            'New Game',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        RaisedButton(
                          elevation: 0.0,
                          splashColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side:
                                  BorderSide(width: 1.5, color: Colors.black)),
                          onPressed: () {
                            _onMainMenuPressed();
                                                      },
                                                      color: Colors.blue,
                                                      child: Text(
                                                        'Main Menu',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.w300),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            
                            
                            
                              void _onNewGamePressed() {
                                // headerBloc.newGameSink.add(1);
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                  context, SlidePageRoute(
                                  child: GamePage()
                                ));
                              }
                            
                              void _onMainMenuPressed() {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
}
