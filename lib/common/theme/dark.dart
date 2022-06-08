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
        displayColor: AppColors.kWhite,
        bodyColor: AppColors.kWhite,
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

ThemeData get buildDarkTheme {
  final base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    textTheme: buildTextTheme(base.textTheme),
    //! need modify setting dark mode here
  );
}
