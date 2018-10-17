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
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjdXN0b20iLCJwaG9uZU51bWJlciI6IjEyMzQ1NiIsInJvbGVJZCI6IjEiLCJpc3MiOiJtZXJjdWxldCIsImV4cCI6MTUzOTc1NzAzMSwidXNlcklkIjoiMSIsImlhdCI6MTUzNzE2NTAzMX0.c-ur_v1vlO_E-oY5seiK18NfciiIxzXyhT20e9HCp8Q",
        });
    dio = new Dio(options);
    HttpInterceptor(dio);
  }

  Future<dynamic> get(String path, {dynamic data}) async {
    return dio.get(path, data: data).then(_checkStatus);
  }

  Future<dynamic> post(String path, {dynamic data}) async {
    return dio.post(path, data: data).then(_checkStatus);
  }

  Future<dynamic> _checkStatus(Response response) async {
      // 如果http状态码正常，则直接返回数据
      if (response.statusCode == HttpStatus.ok) {
        if (json.decode(response.data)["code"] == 0) {
          return response.data;
        }
        throw DioError(response: response, message: json.decode(response.data)["message"],type: DioErrorType.RESPONSE);
      } else {
        throw DioError(response: response, message: "网络异常",type: DioErrorType.RESPONSE);
      }
  }
}
