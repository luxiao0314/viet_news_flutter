import 'package:dio/dio.dart';
import 'package:viet_news_flutter/util/tools.dart' as Tools;

class Logger {
  Dio dio;

  Logger(Dio dio) {
    this.dio = dio;
  }

  void log(String path, data, String method, dynamic params) async {
    this.dio.interceptor.response.onSuccess = ((response) {
      Tools.print3(path, method, params, response ,true);
    });
    this.dio.interceptor.response.onError = ((error) {
      Tools.print3(path, method, params, error,false);
    });
  }
}