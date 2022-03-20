import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static dioInit() => dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ));

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
  }) async =>
      await dio.get(url, queryParameters: query);
}
