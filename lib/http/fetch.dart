import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:viet_news_flutter/http/APIService.dart';
import 'package:viet_news_flutter/http/BaseResponse.dart';
import 'package:viet_news_flutter/http/HttpInterceptor.dart';
import 'package:viet_news_flutter/manager/ToastManager.dart';

class Fetch {
  Dio dio;
  static Fetch instance;

  static Fetch get init {
    if (instance == null) {
      instance = new Fetch();
    }
    return new Fetch();
  }

  Fetch() {
    Options options = new Options(
        responseType: ResponseType.PLAIN,
        baseUrl: ApiService.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          "Authorization":
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjdXN0b20iLCJwaG9uZU51bWJlciI6IjE4Njc0MzU1MDQxIiwicm9sZUlkIjoiMSIsImlzcyI6Im1lcmN1bGV0IiwiZXhwIjoxNTQyMzU4MTA5LCJ1c2VySWQiOiIyMCIsImlhdCI6MTUzOTc2NjEwOX0.bLA3XwTMUqz3AqKCjLUbam3ChZeXNLWPrcM6pHe7r8Q",
        });
    dio = new Dio(options);
    HttpInterceptor(dio);
  }

  Future<dynamic> get(String path, {dynamic data}) async {
    return dio.get(path, data: data);
  }

  Future<dynamic> post(String path, {dynamic data}) async {
    return dio.post(path, data: data);
  }
}
