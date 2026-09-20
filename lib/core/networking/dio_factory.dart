import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task_app/core/networking/api_constants.dart';
import 'package:task_app/main.dart';

class DioFactory {
  static late Dio _dio;

  static Dio getDio() {
    Duration duration = const Duration(seconds: 30);
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveTimeout: duration,
      connectTimeout: duration,
      sendTimeout: duration,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (o, r) {
        o.headers['Authorization'] = 'Bearer $token';
        r.next(o);
      },
    ));

    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ));

    return _dio;
  }
}
