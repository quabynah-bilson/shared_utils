import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'animated.column.dart';

class AnimatedListView extends StatelessWidget {
  final List<Widget> children;
  final AnimateType animateType;
  final EdgeInsets padding;
  final int duration;
  final double slideOffset;

  const AnimatedListView({
    Key? key,
    required this.children,
    this.animateType = AnimateType.slideLeft,
    this.padding = EdgeInsets.zero,
    this.duration = 500,
    this.slideOffset = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = const SizedBox.shrink();
    if (animateType == AnimateType.slideUp) {
      widget = AnimationLimiter(
        child: ListView(
          shrinkWrap: true,
          padding: padding,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: duration),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: slideOffset,
              child: SlideAnimation(child: widget),
            ),
            children: children,
          ),
        ),
      );
    }
    if (animateType == AnimateType.slideLeft) {
      widget = AnimationLimiter(
        child: ListView(
          shrinkWrap: true,
          padding: padding,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: duration),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: slideOffset,
              child: FadeInAnimation(child: widget),
            ),
            children: children,
          ),
        ),
      );
    }

    if (animateType == AnimateType.slideRight) {
      widget = AnimationLimiter(
        child: ListView(
          shrinkWrap: true,
          padding: padding,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: duration),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: -slideOffset,
              child: FadeInAnimation(child: widget),
            ),
            children: children,
          ),
        ),
      );
    }

    if (animateType == AnimateType.slideDown) {
      widget = AnimationLimiter(
        child: ListView(
          shrinkWrap: true,
          padding: padding,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: duration),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: -slideOffset,
              child: FadeInAnimation(child: widget),
            ),
            children: children,
          ),
        ),
      );
    }

    return widget;
  }
}
