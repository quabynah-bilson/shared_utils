library shared_utils;

import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';

/// light theme
@Deprecated('will be removed in newer version')
ThemeData kLightTheme({required BuildContext context}) =>
    ThemeData.light(useMaterial3: true).copyWith(
      textTheme: kPrimaryFonts.copyWith(
        headlineLarge: kPrimaryTextStyle.copyWith(
            color: Colors.black, fontWeight: FontWeight.bold),
        headlineMedium: kPrimaryTextStyle.copyWith(color: Colors.black),
        headlineSmall: kPrimaryTextStyle.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: kPrimaryTextStyle.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.7),
        titleMedium: kPrimaryTextStyle.copyWith(color: Colors.black),
        titleSmall: kPrimaryTextStyle.copyWith(color: Colors.black54),
        bodyLarge: kPrimaryTextStyle.copyWith(color: Colors.black),
        bodyMedium: kPrimaryTextStyle.copyWith(
            color: Colors.black54, fontWeight: FontWeight.bold),
        bodySmall: kPrimaryTextStyle.copyWith(
            color: Colors.black, fontWeight: FontWeight.bold),
        labelSmall: kPrimaryTextStyle.copyWith(color: Colors.black),
        labelLarge: kPrimaryTextStyle.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold),
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
@Deprecated('will be removed in newer version')
ThemeData kDarkTheme({required BuildContext context}) =>
    ThemeData.dark(useMaterial3: true).copyWith(
      scaffoldBackgroundColor: const Color(0xff1A1A1A),
      // backgroundColor: const Color(0xff1A1A1A),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff1A1A1A),
        enableFeedback: true,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xffFFFD02),
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: Color(0xff222222),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,
        toolbarHeight: kToolbarHeight * 1.3,
      ),
      textTheme: kPrimaryFonts.copyWith(
        headlineLarge: kPrimaryTextStyle.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold),
        headlineMedium: kPrimaryTextStyle.copyWith(color: Colors.white),
        headlineSmall: kPrimaryTextStyle.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: kPrimaryTextStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.7),
        titleMedium: kPrimaryTextStyle.copyWith(color: Colors.white),
        titleSmall: kPrimaryTextStyle.copyWith(color: Colors.white70),
        bodyLarge: kPrimaryTextStyle.copyWith(color: Colors.white),
        bodyMedium: kPrimaryTextStyle.copyWith(
            color: Colors.white60, fontWeight: FontWeight.bold),
        bodySmall: kPrimaryTextStyle.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold),
        labelSmall: kPrimaryTextStyle.copyWith(color: Colors.white),
        labelLarge: kPrimaryTextStyle.copyWith(
            color: const Color(0xff14121e), fontWeight: FontWeight.bold),
      ),
      colorScheme: const ColorScheme.dark(
        background: Color(0xff1A1A1A),
        onBackground: Colors.white,
        primary: Color(0xffFFFD02),
        onPrimary: Color(0xff14121e),
        primaryContainer: Color(0xffFFFD02),
        onPrimaryContainer: Color(0xff14121e),
        secondary: Color(0xffFDFE01),
        onSecondary: Color(0xff14121e),
        secondaryContainer: Color(0xffFDFE01),
        onSecondaryContainer: Color(0xff14121e),
        tertiary: Color(0xff282828),
        onTertiary: Colors.white,
        tertiaryContainer: Color(0xff000000),
        onTertiaryContainer: Colors.white,
        surface: Color(0xff222222),
        onSurface: Colors.white,
        surfaceTint: Color(0xff313131),
        errorContainer: Colors.pink,
        onErrorContainer: Colors.white,
        error: Colors.pink,
        onError: Colors.white,
      ),
    );
