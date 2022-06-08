import 'dart:async';

import 'package:dio/dio.dart';

import '../config.dart';

class DioClient {
  static late Dio _dio;

  static FutureOr<Dio> setup() async {
    final baseUrl = Configurations.baseUrl;

    final options = BaseOptions(
      responseType: ResponseType.json,
      baseUrl: baseUrl,
    );

    _dio = Dio(options);

    // Unified add authentication request header
    //_dio.interceptors.add(AuthInterceptor());

    return _dio;
  }

  static Dio get dio => _dio;
}
