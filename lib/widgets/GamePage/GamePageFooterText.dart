import 'package:flutter/material.dart';
import 'package:reversi/blocs/GamePageFooterBloc.dart';
import 'package:reversi/blocs/GamePageHeaderBloc.dart';
import 'package:reversi/blocs/bloc_provider.dart';

class GamePageFooterText extends StatefulWidget {
  final int index;

  const GamePageFooterText({Key key, this.index}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return GamePageFooterTextState();
  }
}

class GamePageFooterTextState extends State<GamePageFooterText>
    with TickerProviderStateMixin {
  String onScreenText;
  String offScreenText;

  GamePageFooterBloc gamePageFooterBloc;
  GamePageHeaderBloc gamePageHeaderBloc;

  @override
  void initState() {
    gamePageFooterBloc = BlocProvider.of<GamePageFooterBloc>(context);
    gamePageHeaderBloc = BlocProvider.of<GamePageHeaderBloc>(context)
      ..validMoveStream.listen((data) {
        gamePageFooterBloc.turnSink.add(null);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      stream: gamePageFooterBloc.textStream,
      initialData: ['', 'Let\'s Play!'],
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        return AnimatedText(
            onScreenText: onScreenText,
            offScreenText: offScreenText,
            snapshot: snapshot,
            index: widget.index);
      },
    );
  }
}

class AnimatedText extends StatefulWidget {
  String onScreenText, offScreenText;
  AsyncSnapshot<List<String>> snapshot;
  final int index;
  AnimatedText(
      {this.onScreenText, this.offScreenText, this.snapshot, this.index});

  @override
  State<StatefulWidget> createState() {
    return AnimatedTextState();
  }
}

class AnimatedTextState extends State<AnimatedText>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: 1));
    animation = Tween<Offset>(
            begin: Offset(
                widget.index.toDouble(),
                // widget.index.toDouble() +
                //     (1 - widget.index.toDouble()) *
                //         (0.5 * (1 - widget.index) -
                //             0.010 * widget.snapshot.data[widget.index].length),
                0.0),
            end: Offset(
                widget.index.toDouble() - 1,
                // (widget.index.toDouble() - 1) +
                //     (widget.index.toDouble()) *
                //         (0.5 * widget.index -
                //             0.010 * widget.snapshot.data[widget.index].length),
                0.0))
        .animate(_controller);
    animation.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedText oldWidget) {
    _controller.reset();
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: FractionalTranslation(
        //0.016 for one digit
        translation: animation.value,
        child: Center(
          child: Text(
            widget.snapshot.data[widget.index],
            style:
                TextStyle(fontSize: 16.0, color: Colors.brown.withOpacity(0.85)),
          ),
        ),
      ),
    );
  }
}
