import 'package:flutter/material.dart';

abstract class Breakpoints {
  /// Max width for a large layout.
  static const double large = 1500;

  /// Max width for a medium layout.
  static const double medium = 1100;

  /// Max width for a small layout.
  static const double small = 800;

  /// Max width for an extra small layout.
  static const double extraSmall = 500;
}

/// Signature for the individual builders (`small`, `medium`, `large` etc.).
typedef ResponsiveLayoutWidgetBuilder = Widget Function(BuildContext, Widget?);

/// A wrapper around [LayoutBuilder] which exposes builders for
/// various responsive breakpoints.
class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder({
    required this.child,
    this.extraSmall,
    this.small,
    this.medium,
    this.large,
    this.extraLarge,
    super.key,
  });

  /// [ResponsiveLayoutWidgetBuilder] for extra small layout.
  final ResponsiveLayoutWidgetBuilder? extraSmall;

  /// [ResponsiveLayoutWidgetBuilder] for small layout.
  final ResponsiveLayoutWidgetBuilder? small;

  /// [ResponsiveLayoutWidgetBuilder] for medium layout.
  final ResponsiveLayoutWidgetBuilder? medium;

  /// [ResponsiveLayoutWidgetBuilder] for large layout.
  final ResponsiveLayoutWidgetBuilder? large;

  /// [ResponsiveLayoutWidgetBuilder] for extraLarge layout.
  final ResponsiveLayoutWidgetBuilder? extraLarge;

  /// Child widget which will be passed
  /// to builders as a way to share/optimize shared layout.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= Breakpoints.extraSmall) {
          // show the child widget if no builder is provided
          return extraSmall?.call(context, child) ?? child;
        }

        if (constraints.maxWidth <= Breakpoints.small) {
          return small?.call(context, child) ?? child;
        }

        if (constraints.maxWidth <= Breakpoints.medium) {
          return medium?.call(context, child) ?? child;
        }

        if (constraints.maxWidth <= Breakpoints.large) {
          return large?.call(context, child) ?? child;
        }

        return extraLarge?.call(context, child) ?? child;
      },
    );
  }
}
