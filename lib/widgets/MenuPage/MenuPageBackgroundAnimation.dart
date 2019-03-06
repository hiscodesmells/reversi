import 'package:flutter/material.dart';
import 'package:reversi/blocs/bloc_provider.dart';
import 'package:reversi/blocs/AnimatedDotBloc.dart';
import 'package:reversi/widgets/MenuPage/AnimatedDot.dart';

class MenuPageBackgroundAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuPageBackgroundAnimationState();
  }
}

class MenuPageBackgroundAnimationState
    extends State<MenuPageBackgroundAnimation> with TickerProviderStateMixin {
  AnimatedDotBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<AnimatedDotBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder<List<double>>(
          stream: bloc.dot1Stream,
          initialData: [100.0, 10.0],
          builder:
              (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
            return Positioned(
              top: snapshot.data[0] % (320),
              left: snapshot.data[1] % (360),
              child: AnimatedDot(
                color: Colors.red[600],
                radius: 24.0,
                opacity: 0.35,
              ),
            );
          },
        ),
        StreamBuilder<List<double>>(
          stream: bloc.dot2Stream,
          initialData: [100.0, 10.0],
          builder:
              (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
            return Positioned(
              top: snapshot.data[0] % (320),
              left: snapshot.data[1] % (360),
              child: AnimatedDot(
                color: Colors.blue,
                radius: 24.0,
                opacity: 0.35,
              ),
            );
          },
        ),
        StreamBuilder<List<double>>(
          stream: bloc.dot3Stream,
          initialData: [100.0, 10.0],
          builder:
              (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
            return Positioned(
              top: snapshot.data[0] % (320),
              left: snapshot.data[1] % (360),
              child: AnimatedDot(
                color: Colors.red[600],
                radius: 24.0,
                opacity: 0.35,
              ),
            );
          },
        ),
        StreamBuilder<List<double>>(
          stream: bloc.dot4Stream,
          initialData: [100.0, 10.0],
          builder:
              (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
            return Positioned(
              top: snapshot.data[0] % (320),
              left: snapshot.data[1] % (360),
              child: AnimatedDot(
                color: Colors.blue,
                radius: 24.0,
                opacity: 0.35,
              ),
            );
          },
        ),
        StreamBuilder<List<double>>(
          stream: bloc.dot5Stream,
          initialData: [100.0, 10.0],
          builder:
              (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
            return Positioned(
              top: 500.0 + snapshot.data[0] % (140),
              left: snapshot.data[1] % (360),
              child: AnimatedDot(
                color: Colors.red[600],
                radius: 24.0,
                opacity: 0.35,
              ),
            );
          },
        ),
        StreamBuilder<List<double>>(
          stream: bloc.dot6Stream,
          initialData: [100.0, 10.0],
          builder:
              (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
            return Positioned(
              top: 500.0 + snapshot.data[0] % (140),
              left: snapshot.data[1] % (360),
              child: AnimatedDot(
                color: Colors.blue,
                radius: 24.0,
                opacity: 0.35,
              ),
            );
          },
        )
      ],
    );
  }
}


