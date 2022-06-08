part of '../injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerFactory<AppRepository>(
      () => AppRepositoryImpl(
        api: getIt.get<AppApi>(),
        dataManager: getIt.get<DataManager>(),
      ),
    );
  }
}
