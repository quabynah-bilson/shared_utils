library shared_utils;

import 'package:flutter/material.dart';

/// size configuration
class SizeConfig {
  static double kDeviceWidth = 0;
  static double kDeviceHeight = 0;

  static void init(BuildContext context) {
    var size = MediaQuery.of(context).size;
    kDeviceWidth = size.width;
    kDeviceHeight = size.height;
  }

  /// mobile view
  static bool get kIsMobile => kDeviceWidth < 650;

  /// tablet view
  static bool get kIsTablet => kDeviceWidth >= 650 && kDeviceWidth < 1080;

  /// desktop view
  static bool get kIsDesktop => kDeviceWidth >= 1080;
}
