import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/repositories/app_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeMode mode;
  final AppRepository repository;

  ThemeCubit({required this.mode, required this.repository})
      : super(ThemeState(themeMode: mode));

  void updateTheme({required bool isDarkMode}) {
    try {
      emit(state.copyWith(
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      ));
      repository.setTheme(isDark: isDarkMode);
    } catch (_) {}
  }
}
