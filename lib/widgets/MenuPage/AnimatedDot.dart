import 'package:flutter/material.dart';

class AnimatedDot extends StatefulWidget {
  final Color color;
  final double radius;
  final double opacity;
  AnimatedDot(
      {Key key, @required this.color, @required this.radius, this.opacity})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimatedDotState();
  }
}

class AnimatedDotState extends State<AnimatedDot>
    with TickerProviderStateMixin {
  Animation animation;
  Animation slideAnimation;
  AnimationController _fadeInOutController;
  AnimationController _slideController;
  Tween tween;

  @override
  void initState() {
    _fadeInOutController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _slideController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    tween = Tween<double>(begin: 0.0, end: widget.opacity);
    animation = tween
        .animate(CurvedAnimation(curve: Curves.linear, parent: _fadeInOutController));
    slideAnimation =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, 2.0)).animate(
            CurvedAnimation(curve: Curves.linear, parent: _slideController));
    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedDot oldWidget) {
    animation.addListener(() {
      setState(() {});
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeInOutController.reverse();
      }
    });
    slideAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _slideController.forward().whenComplete(() {
          _slideController.reset();
        });
      }
    });
    _slideController.forward().whenComplete(() {
      _slideController.reset();
    });
    _fadeInOutController.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _fadeInOutController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: Container(
        decoration: BoxDecoration(
            color: widget.color.withOpacity(animation.value),
            shape: BoxShape.circle,
            border: Border.all(
                width: 2, color: Colors.black.withOpacity(animation.value))),
        child: SizedBox(
          height: widget.radius,
          width: widget.radius,
        ),
      ),
    );
  }
}