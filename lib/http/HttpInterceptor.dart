import 'package:dio/dio.dart';
import 'package:viet_news_flutter/http/HandleException.dart';
import 'package:viet_news_flutter/manager/ToastManager.dart';

class HttpInterceptor {
  Dio dio;

  HttpInterceptor(Dio dio) {
    this.dio = dio;
    initInterceptor();
    getToken();
  }

  ///拦截器,可处理loading
  initInterceptor() {
    dio.interceptor.request.onSend = (Options options) async {
      return options;
    };
    dio.interceptor.response.onSuccess = (Response response) async {
      return response;
    };
    dio.interceptor.response.onError = (DioError e) async {
      print("error: $e");
      var handle = HandleException.handle(e);
      toasts(handle.message);
      return handle;
    };
  }

  ///token过期处理
  getToken() {
    dio.interceptor.response.onError = (DioError error) {
      String token;
      if (error.response?.statusCode == 401) {
        Options options = error.response.request;
        if (token != options.headers["token"]) {
          options.headers["token"] = token;
          return dio.request(options.path, options: options);
        }
        dio.interceptor.request.lock();
        dio.interceptor.response.lock();
        return dio.get("/token").then((d) {
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
}
