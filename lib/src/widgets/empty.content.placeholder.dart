import 'package:flutter/material.dart';
import 'package:shared_utils/shared_utils.dart';

import 'animated.column.dart';

class EmptyContentPlaceholder extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;

  const EmptyContentPlaceholder(
      {Key? key, required this.title, required this.subtitle, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedColumn(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...{
          Icon(icon, size: 48, color: context.colorScheme.secondary).bottom(16),
        },
        title
            .h6(context,
                color: context.colorScheme.secondary,
                alignment: TextAlign.center)
            .bottom(8),
        subtitle.subtitle2(context,
            alignment: TextAlign.center, emphasis: kEmphasisMedium),
      ],
    ).horizontal(40).centered();
  }
}
