import 'package:dio/dio.dart';

class ApiService {

  static final String sendSMS = "v1/login/sendSms";
  static final String register = "v1/login/register";
  static final String list4Channel = "v1/content/list4Channel";

  static final ApiService _singleton = ApiService._internal();
  factory ApiService() {
    return _singleton;
  }

  final Dio _dio = Dio();
  ApiService._internal() {
    _dio.options.responseType = ResponseType.PLAIN;
    _dio.options.baseUrl = 'http://magicbox.liaoyantech.cn/magicbox/api/';
  }

  // 暂时写死，后期会改
  final Map<String, String> headers = {
    "Authorization":
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjdXN0b20iLCJwaG9uZU51bWJlciI6IjEyMzQ1NiIsInJvbGVJZCI6IjEiLCJpc3MiOiJtZXJjdWxldCIsImV4cCI6MTUzOTc1NzAzMSwidXNlcklkIjoiMSIsImlhdCI6MTUzNzE2NTAzMX0.c-ur_v1vlO_E-oY5seiK18NfciiIxzXyhT20e9HCp8Q"
  };

  Future<Response> getChannelList() => _dio.post("v1/channel/list");

  Future<Response> getAllChannelList() =>
      _dio.post("v1/channel/allList", options: Options(headers: headers));

  /// 获取首页内容 根据不同的参数
  Future<Response> getContentList(dynamic params) =>
      _dio.post("v1/content/list4Channel",
          options: Options(
            data: params,
            connectTimeout: 5000,
            receiveTimeout: 5000,
          ));

  /// 用户给某一篇文章点赞
  Future<Response> requestContentListLike(String id) =>
      _dio.get("v1/content/like/$id", options: Options(headers: headers));

  /// 用户收藏一篇文章
  Future<Response> requestContentListCollection(String id) =>
      _dio.get("v1/content/collection/$id", options: Options(headers: headers));

  /// 提交频道排序结果
  Future<Response> updateChannelSort(dynamic params) =>
      _dio.post("v1/channel/updateSort",
          options: Options(
            headers: headers,
            data: params,
            connectTimeout: 5000,
            receiveTimeout: 5000,
          ));
}
