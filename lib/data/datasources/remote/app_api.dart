import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/guess_daily_result/guess_daily_result.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @GET("daily")
  Future<List<GuessDailyResult>> verifyGuessDaily(
    @Query("guess") String guess,
    @Query("size") int size,
  );
}
