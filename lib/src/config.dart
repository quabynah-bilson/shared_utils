library shared_utils;

import 'package:flutter/material.dart';

/// size configuration
@Deprecated(
    'This class will no longer be supported in newer versions. Use BuildContext#colorScheme etc')
class SizeConfig {
  static double kDeviceWidth = 0;
  static double kDeviceHeight = 0;
  static late ThemeData kTheme;
  static late TextTheme kTextTheme;
  static late ColorScheme kColorScheme;

  @Deprecated('This function will no longer be supported in newer versions')
  static void init(BuildContext context) {
    kTheme = Theme.of(context);
    kColorScheme = kTheme.colorScheme;
    kTextTheme = kTheme.textTheme;
    var size = MediaQuery.of(context).size;
    kDeviceWidth = size.width;
    kDeviceHeight = size.height;
  }

  /// mobile view
  @Deprecated('This function will no longer be supported in newer versions')
  static bool get kIsMobile => kDeviceWidth < 650;

  /// tablet view
  @Deprecated('This function will no longer be supported in newer versions')
  static bool get kIsTablet => kDeviceWidth >= 650 && kDeviceWidth < 1080;

  /// desktop view
  @Deprecated('This function will no longer be supported in newer versions')
  static bool get kIsDesktop => kDeviceWidth >= 1080;
}
