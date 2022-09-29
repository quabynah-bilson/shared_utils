import 'package:flutter/material.dart';
import 'package:shared_utils/src/extensions.dart';

/// creates a responsive layout for mobile, tablet & desktop
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: LayoutBuilder(
      builder: (_, constraints) => context.isMobile
          ? mobile
          : context.isTablet
              ? tablet ?? mobile
              : desktop ?? mobile,
    ));
  }
}
