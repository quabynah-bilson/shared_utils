import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'animated.column.dart';

class AnimatedListView extends StatelessWidget {
  final List<Widget> children;
  final AnimateType animateType;
  final EdgeInsets padding;
  final int duration;

  const AnimatedListView({
    Key? key,
    required this.children,
    this.animateType = AnimateType.slideLeft,
    this.padding = EdgeInsets.zero,
    this.duration = 500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (animateType == AnimateType.slideUp) {
      return AnimationLimiter(
        child: ListView(
          shrinkWrap: true,
          padding: padding,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: duration),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 50.0,
              child: SlideAnimation(child: widget),
            ),
            children: children,
          ),
        ),
      );
    } else {
      return AnimationLimiter(
        child: ListView(
          shrinkWrap: true,
          padding: padding,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: duration),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(child: widget),
            ),
            children: children,
          ),
        ),
      );
    }
  }
}
