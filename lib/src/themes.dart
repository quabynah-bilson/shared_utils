library shared_utils;

import 'package:flutter/material.dart';
import 'package:shared_utils/src/config.dart';

import 'colors.dart';
import 'constants.dart';
import 'spacing.dart';

/// light theme
ThemeData kLightTheme({required BuildContext context}) =>
    ThemeData.light().copyWith(
      textTheme: kPrimaryFonts.copyWith(
        button: kSecondaryFonts.button?.copyWith(
          fontWeight: FontWeight.bold,
          color: kWhiteColor,
        ),
        subtitle1: kSecondaryFonts.subtitle1
            ?.copyWith(color: kBlackColor),
        subtitle2: kPrimaryFonts.subtitle2?.copyWith(
          fontSize: kSpacingX16,
          color: kBlackColor,
        ),
        bodyText1: kSecondaryFonts.bodyText1
            ?.copyWith(color: kBlackColor),
        caption: kSecondaryFonts.caption
            ?.copyWith(color: kBlackColor),
        overline: kSecondaryFonts.overline
            ?.copyWith(color: kBlackColor),
        headline4: kPrimaryFonts.headline4?.copyWith(
          fontWeight: FontWeight.bold,
          color: kBlackColor,
        ),
        headline6: kPrimaryFonts.headline6?.copyWith(
          fontWeight: FontWeight.bold,
          color: kBlackColor,
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
        button: kSecondaryFonts.button?.copyWith(
          fontWeight: FontWeight.bold,
          color: kBlackColor,
        ),
        subtitle1: kSecondaryFonts.subtitle1
            ?.copyWith(color: kWhiteColor),
        subtitle2: kPrimaryFonts.subtitle2?.copyWith(
          fontSize: kSpacingX16,
          color: kWhiteColor,
        ),
        bodyText1: kSecondaryFonts.bodyText1
            ?.copyWith(color: kWhiteColor),
        caption: kSecondaryFonts.caption
            ?.copyWith(color: kWhiteColor),
        overline: kSecondaryFonts.overline
            ?.copyWith(color: kWhiteColor),
        headline4: kPrimaryFonts.headline4?.copyWith(
          fontWeight: FontWeight.bold,
          color: kWhiteColor,
        ),
        headline6: kPrimaryFonts.headline6?.copyWith(
          fontWeight: FontWeight.bold,
          color: kWhiteColor,
        ),
      ),
      colorScheme: ColorScheme.dark().copyWith(
        background: kDarkBackgroundColor,
        primary: kDarkPrimaryColor,
        secondary: kDarkPrimaryColor,
      ),
    );
