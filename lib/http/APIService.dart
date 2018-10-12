import 'package:dio/dio.dart';

class ApiService {
  static final ApiService _singleton = ApiService._internal();
  factory ApiService() {
    return _singleton;
  }

  final Dio _dio = Dio();
  ApiService._internal() {
    _dio.options.responseType = ResponseType.PLAIN;
    _dio.options.baseUrl = 'http://magicbox.liaoyantech.cn/magicbox/api/';
  }

  Future<Response> getChannelList() => _dio.post("v1/channel/list");

  Future<Response> getAllChannelList() => _dio.post("v1/channel/allList",
      options: Options(headers: {
        "Authorization": //TODO(tsing) 先写死一个token，之后获取到了token再考虑怎么传过来 。
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjdXN0b20iLCJwaG9uZU51bWJlciI6IjEyMzQ1NiIsInJvbGVJZCI6IjEiLCJpc3MiOiJtZXJjdWxldCIsImV4cCI6MTUzOTc1NzAzMSwidXNlcklkIjoiMSIsImlhdCI6MTUzNzE2NTAzMX0.c-ur_v1vlO_E-oY5seiK18NfciiIxzXyhT20e9HCp8Q"
      }));
}
