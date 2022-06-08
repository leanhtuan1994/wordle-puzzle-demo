part of '../injection.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    final dio = await DioClient.setup();

    getIt.registerSingleton<AppApi>(AppApi(
      dio,
      baseUrl: dio.options.baseUrl,
    ));
  }
}
