part of '../app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final AppApi api;
  final DataManager dataManager;

  AppRepositoryImpl({
    required this.api,
    required this.dataManager,
  });

  @override
  void setLanguageCode({required String lang}) {
    dataManager.saveLanguage(lang);
  }

  @override
  void setTheme({required bool isDark}) {
    dataManager.setDarkMode(dark: isDark);
  }

  @override
  Future<List<GuessDailyResult>> verifyGuessDaily(
      {required String guess, int size = 5}) {
    return api.verifyGuessDaily(guess, size);
  }
}
