import '../datasources/local/data_manager.dart';
import '../datasources/remote/app_api.dart';
import '../models/guess_daily_result/guess_daily_result.dart';

part './impl/app_repository_impl.dart';

abstract class AppRepository {
  void setLanguageCode({required String lang});
  void setTheme({required bool isDark});

  Future<List<GuessDailyResult>> verifyGuessDaily(
      {required String guess, int size = 5});
}
