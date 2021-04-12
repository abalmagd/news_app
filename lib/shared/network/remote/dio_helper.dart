import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static dioInit() => dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        receiveDataWhenStatusError: true,
      ));

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
  }) async =>
      await dio.get(url, queryParameters: query);
}
