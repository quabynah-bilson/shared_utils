import 'package:flutter/material.dart';

import 'breakpoints.dart';

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
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => switch (constraints.maxWidth) {
          >= Breakpoints.extraLarge =>
            extraLarge?.call(context, child) ?? child,
          >= Breakpoints.large => large?.call(context, child) ?? child,
          >= Breakpoints.medium => medium?.call(context, child) ?? child,
          >= Breakpoints.small => small?.call(context, child) ?? child,
          >= Breakpoints.extraSmall =>
            extraSmall?.call(context, child) ?? child,
          _ => child,
        },
      );
}
