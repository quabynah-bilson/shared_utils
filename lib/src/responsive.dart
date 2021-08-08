import 'package:flutter/material.dart';
import 'config.dart';

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
      builder: (_, constraints) => SizeConfig.kIsMobile
          ? mobile
          : SizeConfig.kIsTablet
              ? tablet ?? mobile
              : desktop ?? mobile,
    ));
  }
}
