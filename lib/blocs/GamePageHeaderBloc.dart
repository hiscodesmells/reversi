import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reversi/blocs/bloc_provider.dart';

class GamePageHeaderBloc extends BlocBase {
  Timer timer;
  int time;
  int turn;
  var _board;
  StreamController<int> _turnController = StreamController<int>.broadcast();
  Stream<int> get turnStream => _turnController.stream;
  Sink<int> get turnSink => _turnController.sink;

  StreamController<int> _timeController = StreamController<int>.broadcast();
  Stream<int> get timeStream => _timeController.stream;
  Sink<int> get timeSink => _timeController.sink;

  StreamController<List<List<Color>>> _validMoveController =
      StreamController<List<List<Color>>>.broadcast();
  Stream<List<List<Color>>> get validMoveStream => _validMoveController.stream;
  Sink<List<List<Color>>> get validMoveSink => _validMoveController.sink;

  StreamController<List<int>> _scoreController =
      StreamController<List<int>>.broadcast();
  Stream<List<int>> get scoreStream => _scoreController.stream;
  Sink<List<int>> get scoreSink => _scoreController.sink;

  StreamController<int> _pauseController = StreamController<int>.broadcast();
  Stream<int> get pauseStream => _pauseController.stream;
  Sink<int> get pauseSink => _pauseController.sink;

  StreamController<int> _resumeController = StreamController<int>.broadcast();
  Stream<int> get resumeStream => _resumeController.stream;
  Sink<int> get resumeSink => _resumeController.sink;

  StreamController<int> _newGameController = StreamController<int>.broadcast();
  Stream<int> get newGameStream => _newGameController.stream;
  Sink<int> get newGameSink => _newGameController.sink;

  GamePageHeaderBloc() {
    timer = Timer.periodic(Duration(seconds: 1), _oneSecondCounted);
    time = 30;
    turn = 0;
    _validMoveController.stream.listen(_turnChanged);
    _pauseController.stream.listen(_onPauseClicked);
    _resumeController.stream.listen(_onResumeClicked);
  }


  _onResumeClicked(data){
    timer = Timer.periodic(Duration(seconds: 1), _oneSecondCounted);
  }

  _onPauseClicked(data) {
    timer.cancel();
  }

  _turnChanged(data) {
    (turn == 0) ? turn = 1 : turn = 0;
    _turnController.sink.add(turn);
    _board = data;
    _scoreCalculator();
    _resetTimer();
  }

  _scoreCalculator() {
    int score_red = 0;
    int score_blue = 0;
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (_board[i][j] == Colors.red) {
          score_red++;
        }
        if (_board[i][j] == Colors.blue) {
          score_blue++;
        }
      }
    }
    _scoreController.sink.add([score_blue, score_red]);
  }

  _resetTimer() {
    timer.cancel();
    time = 30;
    timer = Timer.periodic(Duration(seconds: 1), _oneSecondCounted);
    _timeController.sink.add(time);
  }

  _oneSecondCounted(data) {
    time--;
    if (time == -1) {
      time = 30;
      (turn == 0) ? turn = 1 : turn = 0;
      _turnController.sink.add(turn);
    }
    _timeController.sink.add(time);
  }

  @override
  void dispose() {
    timer.cancel();
    _turnController.close();
    _timeController.close();
    _validMoveController.close();
    _scoreController.close();
    _pauseController.close();
    _resumeController.close();
    _newGameController.close();
  }
}
