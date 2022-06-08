// ignore_for_file: unnecessary_lambdas

part of '../data_manager.dart';

class AppPreferencesImpl extends AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferencesImpl({
    required this.sharedPreferences,
  });

  @override
  String getLanguage() {
    return sharedPreferences.getString(AppPreferences.keyLanguage) ??
        Configurations.defaultLanguage;
  }

  @override
  void saveLanguage(String languageCode) {
    sharedPreferences.setString(AppPreferences.keyLanguage, languageCode);
  }

  @override
  Future<void> clear() async {
    await sharedPreferences.clear();
  }

  @override
  bool isDarkMode() {
    return sharedPreferences.getBool(AppPreferences.darkMode) ?? false;
  }

  @override
  void setDarkMode({required bool dark}) {
    sharedPreferences.setBool(AppPreferences.darkMode, dark);
  }
}
