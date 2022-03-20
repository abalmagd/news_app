import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/theme/palette.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
          Palette.teal500.value,
          const {
            100: Palette.teal100,
            200: Palette.teal200,
            300: Palette.teal300,
            400: Palette.teal400,
            500: Palette.teal500,
            600: Palette.teal600,
            700: Palette.teal700,
            800: Palette.teal800,
            900: Palette.teal900,
          },
        ),
        accentColor: Palette.teal500,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: theme.textTheme.headline6.copyWith(
          color: Palette.black,
        ),
        iconTheme: IconThemeData(color: Palette.black),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      textTheme: Typography.blackMountainView,
      dividerColor: Palette.teal500,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
          Palette.teal500.value,
          const {
            100: Palette.teal100,
            200: Palette.teal200,
            300: Palette.teal300,
            400: Palette.teal400,
            500: Palette.teal500,
            600: Palette.teal600,
            700: Palette.teal700,
            800: Palette.teal800,
            900: Palette.teal900,
          },
        ),
        accentColor: Palette.teal500,
      ),
      dividerColor: Palette.teal500,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
    );
  }
}
