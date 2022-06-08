// ignore_for_file: unnecessary_lambdas

part of '../injection.dart';

class ComponentsModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<DataManager>(
      DataManagerImpl(
        appPreferences: AppPreferencesImpl(
          sharedPreferences: await SharedPreferences.getInstance(),
        ),
      ),
    );
  }
}
