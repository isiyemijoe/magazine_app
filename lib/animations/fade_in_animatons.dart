import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'slidein_right_animations.dart';

class FadeInAnimations extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeInAnimations({Key key, @required this.delay, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _tween = TimelineTween<AniProp>()
      ..addScene(begin: 0.milliseconds, duration: 500.milliseconds)
          .animate(AniProp.opacity, tween: 0.0.tweenTo(1.0));

    return PlayAnimation<TimelineValue<AniProp>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: _tween.duration,
      child: child,
      tween: _tween,
      builder: (context, child, value) =>
          Opacity(opacity: value.get(AniProp.opacity), child: child),
    );
  }
}
