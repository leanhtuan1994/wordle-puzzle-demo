part of '../data_manager.dart';

abstract class AppPreferences {
  Future<void> clear();

  void saveLanguage(String languageCode);
  String getLanguage();

  void setDarkMode({required bool dark});
  bool isDarkMode();

  static const String keyLanguage = 'language';
  static const String darkMode = 'darkMode';
}
