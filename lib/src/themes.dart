library shared_utils;

import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';
import 'spacing.dart';

/// light theme
ThemeData kLightTheme({required BuildContext context}) =>
    ThemeData.light().copyWith(
      textTheme: kPrimaryFonts.copyWith(
        button: kSecondaryFonts.button?.copyWith(fontWeight: FontWeight.bold),
        subtitle1: kSecondaryFonts.subtitle1,
        subtitle2: kPrimaryFonts.subtitle2?.copyWith(fontSize: kSpacingX16),
        bodyText1: kSecondaryFonts.bodyText1,
        caption: kSecondaryFonts.caption,
        overline: kSecondaryFonts.overline,
        headline4:
            kPrimaryFonts.headline4?.copyWith(fontWeight: FontWeight.bold),
        headline6: kPrimaryFonts.headline6?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      colorScheme: ColorScheme.light(
        background: kLightBackgroundColor,
        surface: kLightSurfaceColor,
        primary: kBlackColor,
        secondary: kLightSecondaryColor,
        error: kLightErrorColor,
        onPrimary: kWhiteColor,
        onSecondary: kWhiteColor,
        onSurface: kBlackColor,
        onBackground: kBlackColor,
      ),
      cardColor: kLightSurfaceColor,
      disabledColor: kLightDisabledColor,
    );

/// dark theme
ThemeData kDarkTheme({required BuildContext context}) =>
    ThemeData.dark().copyWith(
      scaffoldBackgroundColor: kDarkBackgroundColor,
      textTheme: kPrimaryFonts.copyWith(
        button: kSecondaryFonts.button?.copyWith(fontWeight: FontWeight.bold),
        subtitle1: kSecondaryFonts.subtitle1,
        subtitle2: kPrimaryFonts.subtitle2?.copyWith(fontSize: kSpacingX16),
        bodyText1: kSecondaryFonts.bodyText1,
        caption: kSecondaryFonts.caption,
        overline: kSecondaryFonts.overline,
        headline4:
            kPrimaryFonts.headline4?.copyWith(fontWeight: FontWeight.bold),
      ),
      colorScheme: ColorScheme.dark().copyWith(
        background: kDarkBackgroundColor,
        primary: kDarkPrimaryColor,
        secondary: kDarkPrimaryColor,
      ),
    );
