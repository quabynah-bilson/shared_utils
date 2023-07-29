library shared_utils;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

/// anim
const kDefaultLottieLoadingAnim =
    'https://assets4.lottiefiles.com/packages/lf20_poqmycwy.json';

/// fonts
TextTheme kPrimaryFonts = GoogleFonts.dmSansTextTheme();
TextStyle kPrimaryTextStyle = GoogleFonts.dmSans();
TextTheme kSecondaryFonts = GoogleFonts.rubikTextTheme();

// debugging
final logger = Logger(
  printer: PrettyPrinter(),
  level: kDebugMode ? Level.verbose : Level.nothing,
);
