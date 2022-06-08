import 'package:flutter/material.dart';

import 'colors.dart';

TextTheme buildTextTheme(TextTheme newBase) {
  return newBase
      .copyWith(
        headline1: newBase.headline1?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
        headline2: newBase.headline1?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        headline3: newBase.headline3?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        headline4: newBase.headline4?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        headline5: newBase.headline5?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        button: newBase.button?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        subtitle1: newBase.bodyText1?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        subtitle2: newBase.bodyText2?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        bodyText1: newBase.bodyText1?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: newBase.bodyText2?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      )
      .apply(
        displayColor: AppColors.neutral100,
        bodyColor: AppColors.neutral100,
      );
}

IconThemeData customIconTheme(IconThemeData original) {
  return original.copyWith(color: AppColors.grey900);
}

const ColorScheme kColorScheme = ColorScheme(
  primary: AppColors.primary,
  secondary: AppColors.accent,
  surface: AppColors.surfaceWhite,
  background: Colors.white,
  error: AppColors.errorRed,
  onPrimary: AppColors.darkBG,
  onSecondary: AppColors.grey900,
  onSurface: AppColors.grey900,
  onBackground: AppColors.grey900,
  onError: AppColors.surfaceWhite,
  brightness: Brightness.light,
);

ThemeData get buildLightTheme {
  final base = ThemeData.light();
  return base.copyWith(
    brightness: Brightness.light,
    colorScheme: kColorScheme,
    cardColor: Colors.white,
    errorColor: AppColors.errorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: kColorScheme,
      textTheme: ButtonTextTheme.normal,
      buttonColor: AppColors.darkBG,
    ),
    primaryColorLight: AppColors.lightBG,
    primaryIconTheme: customIconTheme(base.iconTheme),
    textTheme: buildTextTheme(base.textTheme),
    primaryTextTheme: buildTextTheme(base.primaryTextTheme),
    iconTheme: customIconTheme(base.iconTheme),
    hintColor: Colors.black26,
    backgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBG,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
          //color: kLightAccent,
          ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.neutral100,
        ),
        onSurface: Colors.transparent,
        shadowColor: Colors.transparent,
        primary: Colors.transparent,
        onPrimary: AppColors.neutral100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.zero,
      ),
    ),
  );
}
