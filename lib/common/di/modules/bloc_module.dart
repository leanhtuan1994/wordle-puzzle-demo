part of '../injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<LanguageCubit>(
      LanguageCubit(
        language: getIt.get<DataManager>().getLanguage(),
        repository: getIt.get<AppRepository>(),
      ),
    );
    getIt.registerSingleton<ThemeCubit>(
      ThemeCubit(
        mode: getIt.get<DataManager>().isDarkMode()
            ? ThemeMode.dark
            : ThemeMode.light,
        repository: getIt.get<AppRepository>(),
      ),
    );
    getIt.registerFactory<GameBloc>(
      () => GameBloc(
        repository: getIt.get<AppRepository>(),
      ),
    );
  }
}
