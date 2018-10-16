import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:viet_news_flutter/http/BaseResponse.dart';

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
        baseUrl: 'http://magicbox.liaoyantech.cn/magicbox/api/',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          "Authorization":
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjdXN0b20iLCJwaG9uZU51bWJlciI6IjEyMzQ1NiIsInJvbGVJZCI6IjEiLCJpc3MiOiJtZXJjdWxldCIsImV4cCI6MTUzOTc1NzAzMSwidXNlcklkIjoiMSIsImlhdCI6MTUzNzE2NTAzMX0.c-ur_v1vlO_E-oY5seiK18NfciiIxzXyhT20e9HCp8Q",
        });
    dio = new Dio(options);
    initInterceptor();
  }

  initInterceptor() {
    dio.interceptor.request.onSend = (Options options) {
      return options;
    };
    dio.interceptor.response.onSuccess = (Response response) {
      return response; // continue
    };
    dio.interceptor.response.onError = (DioError e) async {
      print("interceptor-error: $e");
      return e;
    };

    /**
     * token过期处理
     */
    String token;
    dio.interceptor.response.onError = (DioError error) {
      if (error.response?.statusCode == 401) {
        Options options = error.response.request;
        if (token != options.headers["token"]) {
          options.headers["token"] = token;
          return dio.request(options.path, options: options);
        }
        dio.interceptor.request.lock();
        dio.interceptor.response.lock();
        return dio.get("/token").then((d) {
          //update csrfToken
          options.headers["token"] = token = d.data['data']['token'];
        }).whenComplete(() {
          dio.interceptor.request.unlock();
          dio.interceptor.response.unlock();
        }).then((e) {
          return dio.request(options.path, options: options);
        });
      }
      return error;
    };
  }

  Future<dynamic> get(String path, {dynamic data}) async {
    print('fetch: get=$path, data=$data');
    return analyzing(await dio.get(path, data: data));
  }

  Future<dynamic> post(String path, {dynamic data}) async {
    print('fetch: post=$path, data=$data');
    return analyzing(await dio.post(path, data: data));
  }

  Future<dynamic> analyzing(Response response) async {
    print('response: ${response.data}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw response.data.message ?? '数据获取失败';
    }
  }

}
