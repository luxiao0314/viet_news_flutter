import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:viet_news_flutter/http/APIService.dart';
import 'package:viet_news_flutter/http/HttpInterceptor.dart';
import 'package:viet_news_flutter/util/Config.dart';
import 'package:viet_news_flutter/util/tools.dart' as Tools;

class Fetch {
  Dio dio;
  static Fetch instance;
  Logger logger;

  static Fetch get init {
    if (instance == null) {
      instance = new Fetch();
    }
    return instance;
  }

  Fetch() {
    Options options = new Options(
        responseType: ResponseType.PLAIN,
        baseUrl: ApiService.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          Config.NETWORK_TOKEN_KEY:
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjdXN0b20iLCJwaG9uZU51bWJlciI6IjE4Njc0MzU1MDQxIiwicm9sZUlkIjoiMSIsImlzcyI6Im1lcmN1bGV0IiwiZXhwIjoxNTQyMzU4MTA5LCJ1c2VySWQiOiIyMCIsImlhdCI6MTUzOTc2NjEwOX0.bLA3XwTMUqz3AqKCjLUbam3ChZeXNLWPrcM6pHe7r8Q",
        });
    dio = new Dio(options);
    HttpInterceptor(dio);
    logger = Logger(dio);
  }

  Future<dynamic> get(String path, {dynamic data}) async {
    logger.log(path, data, "GET", data);
    return dio.get(path, data: data).then(_checkStatus);
  }

  Future<dynamic> post(String path, {dynamic data}) async {
    logger.log(path, data, "POST", data);
    return dio.post(path, data: data).then(_checkStatus);
  }

  Future<dynamic> _checkStatus(Response response) async {
    // 如果http状态码正常，则直接返回数据
    if (response.statusCode == HttpStatus.ok) {
      if (json.decode(response.data)["code"] == 0) {
        return response.data;
      }
      throw DioError(response: response,
          message: json.decode(response.data)["message"],
          type: DioErrorType.RESPONSE);
    } else {
      throw DioError(
          response: response, message: "网络异常", type: DioErrorType.RESPONSE);
    }
  }
}

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
