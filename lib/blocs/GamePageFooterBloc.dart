import 'dart:async';

import 'package:reversi/blocs/bloc_provider.dart';

class GamePageFooterBloc extends BlocBase{

  String onScreenText;
  String offScreenText;
  String tempString;
  List<String> msgs = [
    'Decide your color and play!',
    'Good Move!',
    'Game Over!',
    'Insane!',
    'That was good!',
    'It\'s just the begining',
  ];


  StreamController<List<String>> textController = StreamController<List<String>>.broadcast();
  Stream<List<String>> get textStream => textController.stream;
  Sink<List<String>> get textSink => textController.sink;

  StreamController<int> _turnController = StreamController<int>.broadcast();  
  Stream<int> get turnStream => _turnController.stream;
  Sink<int> get turnSink => _turnController.sink;

  GamePageFooterBloc(){
    onScreenText = 'Good Move!';
    offScreenText = 'Let\'s Play!';
    _turnController.stream.listen(_turnChanged);
  }

  _turnChanged(data){

    

    
    textController.sink.add(['Let\'s Play', 'Good']);
  }

  @override
  void dispose() {
    textController.close();
    _turnController.close();
  }

}