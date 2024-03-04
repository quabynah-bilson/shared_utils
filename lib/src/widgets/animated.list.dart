import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'animated.column.dart';

class AnimatedListView extends StatelessWidget {
  final List<Widget> children;
  final AnimateType animateType;
  final EdgeInsets padding;
  final int duration;
  final double slideOffset;
  final ScrollPhysics? physics;

  const AnimatedListView({
    Key? key,
    required this.children,
    this.animateType = AnimateType.slideLeft,
    this.padding = EdgeInsets.zero,
    this.duration = 500,
    this.slideOffset = 50.0,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      AnimationLimiter(child: listView(children));

  Widget listView(List<Widget> children) {
    SlideAnimation Function(Widget) slideAnimation;

    switch (animateType) {
      case AnimateType.slideUp:
        slideAnimation = (child) => SlideAnimation(
              verticalOffset: slideOffset,
              child: SlideAnimation(child: child),
            );
        break;
      case AnimateType.slideLeft:
        slideAnimation = (child) => SlideAnimation(
              horizontalOffset: slideOffset,
              child: FadeInAnimation(child: child),
            );
        break;
      case AnimateType.slideRight:
        slideAnimation = (child) => SlideAnimation(
              horizontalOffset: -slideOffset,
              child: FadeInAnimation(child: child),
            );
        break;
      default:
        slideAnimation = (child) => SlideAnimation(
              verticalOffset: -slideOffset,
              child: FadeInAnimation(child: child),
            );
        break;
    }

    return ListView(
      shrinkWrap: true,
      padding: padding,
      physics: physics,
      children: AnimationConfiguration.toStaggeredList(
        duration: Duration(milliseconds: duration),
        childAnimationBuilder: (widget) => slideAnimation(widget),
        children: children,
      ),
    );
  }
}
