import 'package:flutter/material.dart';
import 'package:magazine_app/animations/slide_left_animation.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class BottomUpAnimaitons extends StatelessWidget {
  final double delay;
  final Widget child;

  const BottomUpAnimaitons(
      {Key key, @required this.delay, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tween = TimelineTween<AniProp>()
      ..addScene(begin: 0.milliseconds, duration: 500.milliseconds)
          .animate(AniProp.opacity, tween: 0.0.tweenTo(1.0))
      ..addScene(begin: 0.milliseconds, end: 500.milliseconds).animate(
        AniProp.translateY,
        tween: (100.0).tweenTo(0.0),
        curve: Curves.easeOut,
      );

    return PlayAnimation<TimelineValue<AniProp>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: _tween.duration,
      child: child,
      tween: _tween,
      builder: (context, child, value) => Transform.translate(
        offset: Offset(0, value.get(AniProp.translateY)),
        child: Opacity(opacity: value.get(AniProp.opacity), child: child),
      ),
    );
  }
}
