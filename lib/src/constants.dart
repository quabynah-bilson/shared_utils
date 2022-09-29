library shared_utils;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

/// anim
const kDefaultLottieLoadingAnim = 'assets/anim/loading_anim.json';
/// fonts
TextTheme kPrimaryFonts = GoogleFonts.poppinsTextTheme();
TextTheme kSecondaryFonts = GoogleFonts.rubikTextTheme();

// debugging
final logger = Logger();
