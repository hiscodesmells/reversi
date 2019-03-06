import 'dart:async';
import 'dart:math';
import 'package:reversi/blocs/bloc_provider.dart';

class AnimatedDotBloc implements BlocBase {
  Timer timer;
  int dot1;
  int dot2;
  int dot3;
  int dot4;
  int dot5;
  int dot6;

  StreamController<List<double>> dot1Controller =
      StreamController<List<double>>.broadcast();
  Stream<List<double>> get dot1Stream => dot1Controller.stream;
  Sink<List<double>> get dot1Sink => dot1Controller.sink;

  StreamController<List<double>> dot2Controller =
      StreamController<List<double>>.broadcast();
  Stream<List<double>> get dot2Stream => dot2Controller.stream;
  Sink<List<double>> get dot2Sink => dot2Controller.sink;

  StreamController<List<double>> dot3Controller =
      StreamController<List<double>>.broadcast();
  Stream<List<double>> get dot3Stream => dot3Controller.stream;
  Sink<List<double>> get dot3Sink => dot3Controller.sink;

  StreamController<List<double>> dot4Controller =
      StreamController<List<double>>.broadcast();
  Stream<List<double>> get dot4Stream => dot4Controller.stream;
  Sink<List<double>> get dot4Sink => dot4Controller.sink;

  StreamController<List<double>> dot5Controller =
      StreamController<List<double>>.broadcast();
  Stream<List<double>> get dot5Stream => dot5Controller.stream;
  Sink<List<double>> get dot5Sink => dot5Controller.sink;

  StreamController<List<double>> dot6Controller =
      StreamController<List<double>>.broadcast();
  Stream<List<double>> get dot6Stream => dot6Controller.stream;
  Sink<List<double>> get dot6Sink => dot6Controller.sink;

  AnimatedDotBloc() {
    timer = Timer.periodic(Duration(seconds: 1), _durationCounted);
    dot1 = 0;
    dot2 = 0;
    dot3 = 0;
    dot4 = 0;
    dot5 = 0;
    dot6 = 0;
  }

  _durationCounted(data) {
    var rand = Random();
    var top = rand.nextInt(640).roundToDouble();
    var left = rand.nextInt(360).roundToDouble();
    dot1++;
    dot2++;
    dot3++;
    dot4++;
    dot5++;
    dot6++;
    if (dot1 == 7) {
      dot1Controller.sink.add([top, left]);
      dot1 = 2;
    } else {
      if (dot1 == 1) {
        dot1Controller.sink.add([top, left]);
      }
    }
    if (dot2 == 8) {
      dot2Controller.sink.add([top, left]);
      dot2 = 3;
    } else {
      if (dot2 == 2) {
        dot2Controller.sink.add([top, left]);
      }
    }
    if (dot3 == 9) {
      dot3Controller.sink.add([top, left]);
      dot3 = 4;
    } else {
      if (dot3 == 3) {
        dot3Controller.sink.add([top, left]);
      }
    }
    if (dot4 == 10) {
      dot4Controller.sink.add([top, left]);
      dot4 = 5;
    } else {
      if (dot4 == 4) {
        dot4Controller.sink.add([top, left]);
      }
    }
    if (dot5 == 11) {
      dot5Controller.sink.add([top, left]);
      dot5 = 6;
    } else {
      if (dot5 == 5) {
        dot5Controller.sink.add([top, left]);
      }
    }
    if (dot6 == 12) {
      dot6Controller.sink.add([top, left]);
      dot6 = 7;
    } else {
      if (dot6 == 6) {
        dot6Controller.sink.add([top, left]);
      }
    }
  }

  @override
  void dispose() {
    timer.cancel();
    dot1Controller.close();
    dot2Controller.close();
    dot3Controller.close();
    dot4Controller.close();
    dot5Controller.close();
    dot6Controller.close();
  }
}
