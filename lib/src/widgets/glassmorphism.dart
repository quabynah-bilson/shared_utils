library shared_utils;

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:shared_utils/src/colors.dart';
import 'package:shared_utils/src/extensions.dart';

/// create a glass effect
class GlassMorphism extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final double blurRadius;
  final Color? glassColor;

  const GlassMorphism({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.border,
    this.borderRadius,
    this.glassColor,
    this.blurRadius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRect(
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  (glassColor ?? context.colorScheme.surface)
                      .withOpacity(kEmphasisMedium),
                  (glassColor ?? context.colorScheme.surface)
                      .withOpacity(kEmphasisLow),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              border: border,
              borderRadius: borderRadius,
            ),
            margin: margin,
            padding: padding,
            child: child,
          ),
        ),
      );
}
