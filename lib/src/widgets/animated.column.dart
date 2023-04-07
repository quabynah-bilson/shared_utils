import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

enum AnimateType { slideLeft, slideUp, slideRight, slideDown }

class AnimatedColumn extends StatelessWidget {
  final List<Widget> children;
  final AnimateType animateType;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final int duration;
  final double slideOffset;

  const AnimatedColumn({
    Key? key,
    required this.children,
    this.animateType = AnimateType.slideLeft,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.duration = 500,
    this.slideOffset = 50.0,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = const SizedBox.shrink();
    if (animateType == AnimateType.slideUp) {
      widget =  AnimationLimiter(
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
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
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
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
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
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
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
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
