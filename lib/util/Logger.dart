import 'package:dio/dio.dart';
import 'package:viet_news_flutter/util/tools.dart' as Tools;

class Logger {
  Dio dio;

  Logger(Dio dio) {
    this.dio = dio;
  }

  void log(Response res) async {
    var request = res.request;
    Tools.print3(request.baseUrl + request.path, res.request.method, request.headers.toString(),res.request.data, res, true);
  }
}
