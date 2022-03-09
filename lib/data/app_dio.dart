import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider((_) => AppDio.getInstance());

class AppDio with DioMixin implements Dio {
  // private constructor
  AppDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: "https://newsapi.org",
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
  }

  static Dio getInstance() => AppDio._();
}
