import 'package:flutter/material.dart';
import 'package:reversi/blocs/bloc_provider.dart';
import 'package:reversi/blocs/GamePageHeaderBloc.dart';
import 'package:reversi/widgets/GamePage/GamePageGameOverDialog.dart';

class GamePageBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GamePageBoardState();
  }
}

class GamePageBoardState extends State<GamePageBoard>
    with TickerProviderStateMixin {
  var _board = [
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white
    ],
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white
    ],
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white
    ],
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.red,
      Colors.blue,
      Colors.white,
      Colors.white,
      Colors.white
    ],
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.blue,
      Colors.red,
      Colors.white,
      Colors.white,
      Colors.white
    ],
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white
    ],
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white
    ],
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white
    ],
  ];

  final colors = [Colors.blue, Colors.red];

  var turn = 0;

  GamePageHeaderBloc headerBloc;
  AnimationController _controller;
  Animation animation;

  @override
  void initState() {
    headerBloc = BlocProvider.of<GamePageHeaderBloc>(context);
    headerBloc.turnStream.listen((data) {
      turn = data;
    });
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    animation.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  final dir = [
    [0, 1],
    [1, 1],
    [1, 0],
    [1, -1],
    [0, -1],
    [-1, -1],
    [-1, 0],
    [-1, 1]
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            color: Colors.red[900].withOpacity(animation.value),
            border: Border.all(
                width: 2.0,
                color: Colors.red[900].withOpacity(animation.value)),
            borderRadius: BorderRadius.circular(8.0)),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Align(
            alignment: Alignment.center,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
              itemBuilder: (BuildContext context, int index) {
                var _row = (index / 8).floor();
                var _col = index % 8;
                return GestureDetector(
                  onTap: () => _onTileClick(_row, _col),
                  child: Container(
                    margin: EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                        color: _board[_row][_col],
                        shape: BoxShape.circle,
                        border: Border.all(width: 2.0)),
                  ),
                );
              },
              itemCount: 64,
            ),
          ),
        ),
      ),
    );
  }

  _onTileClick(int row, int col) {
    var flipTiles = _isValidMove(row, col);
    if (flipTiles == false) {
      _controller.forward().whenComplete(() {
        _controller.reverse();
      });
    } else {
      setState(() {
        for (var tile in flipTiles) {
          _board[tile[0]][tile[1]] = colors[turn];
        }
        _board[row][col] = colors[turn];
      });

      if (turn == 0)
        turn = 1;
      else
        turn = 0;

      List validMoves = _getValidMoves();

      if (validMoves.isEmpty) {
        headerBloc.pauseSink.add(1);

        String _blueResult, _redResult;
        if (turn == 0) {
          _blueResult = 'Lost';
          _redResult = 'Won ';
        } else {
          _blueResult = 'Won ';
          _redResult = 'Lost';
        }
        showGeneralDialog(
            context: context,
            barrierDismissible: false,
            barrierColor: Colors.black.withOpacity(0.75),
            transitionDuration: Duration(milliseconds: 750),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return GamePageGameOverDialog(
                blueResult: _blueResult,
                redResult: _redResult,
              );
            },
            transitionBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return ScaleTransition(
                child: child,
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: animation, curve: Curves.bounceOut)),
              );
            });
      }
      headerBloc.validMoveSink.add(_board);
    }
  }

  _getValidMoves() {
    var validMoves = [];
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        var temp = _isValidMove(i, j);
        if (temp != false) {
          validMoves.add([i, j]);
        }
      }
    }
    return validMoves;
  }

  _isValidMove(int row, int col) {
    if (_board[row][col] != Colors.white) {
      return false;
    }
    _board[row][col] = colors[turn];

    var tilesToFlip = [];
    for (var direction in dir) {
      var x = row;
      var y = col;
      x = x + direction[0];
      y = y + direction[1];
      if (_isOnBoard(x, y) && _board[x][y] == colors[(turn + 1) % 2]) {
        x = x + direction[0];
        y = y + direction[1];
        if (_isOnBoard(x, y) == false) {
          continue;
        }
        while (_board[x][y] == colors[(turn + 1) % 2]) {
          x = x + direction[0];
          y = y + direction[1];
          if (_isOnBoard(x, y) == false) {
            break;
          }
        }
        if (_isOnBoard(x, y) == false) {
          continue;
        }
        if (_board[x][y] == colors[turn]) {
          while (true) {
            x = x - direction[0];
            y = y - direction[1];
            if (x == row && y == col) {
              break;
            }
            tilesToFlip.add([x, y]);
          }
        }
      }
    }
    _board[row][col] = Colors.white;
    if (tilesToFlip.length == 0) {
      return false;
    } else
      return tilesToFlip;
  }

  _isOnBoard(int row, int col) {
    return (row <= 7 && col <= 7 && row >= 0 && col >= 0) ? true : false;
  }

  @override
  void dispose() {
    headerBloc.dispose();
    _controller.dispose();
    super.dispose();
  }
}
