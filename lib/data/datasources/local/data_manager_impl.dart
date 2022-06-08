part of 'data_manager.dart';

//! some local value need using hive or secure storage, all handle by data manager , called by repository
class DataManagerImpl extends DataManager {
  final AppPreferences appPreferences;

  DataManagerImpl({
    required this.appPreferences,
  });

  @override
  String getLanguage() {
    return appPreferences.getLanguage();
  }

  @override
  void saveLanguage(String languageCode) {
    appPreferences.saveLanguage(languageCode);
  }

  @override
  Future<void> clear() async {
    appPreferences.clear();
  }

  @override
  bool isDarkMode() {
    return appPreferences.isDarkMode();
  }

  @override
  void setDarkMode({required bool dark}) {
    appPreferences.setDarkMode(dark: dark);
  }
}
