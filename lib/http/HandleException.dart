import 'package:dio/dio.dart';

/// @Description 异常错误
/// @Author sean
/// @Email xiao.lu@magicwindow.cn
/// @Date 18/10/2018 1:37 PM
/// @Version
class HandleException {
  static const int ACCESS_DENIED = 302;
  static const int UNAUTHORIZED = 401; //未认证
  static const int FORBIDDEN = 403; //被禁止
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;

  static DioError handle(DioError ex) {
    if (ex.message.contains("TimeoutException")) {
      return DioError(response: ex.response, message: "连接超时", type: DioErrorType.RESPONSE);
    } else if(ex.message.contains("SocketException")){
      return DioError(response: ex.response, message: "网络连接失败", type: DioErrorType.RESPONSE);
    } else if(ex.message.contains("HttpException")){
      switch (ex.response.statusCode) {
        case ACCESS_DENIED:
          return DioError(response: ex.response, message: "拒绝访问", type: DioErrorType.RESPONSE);
        case UNAUTHORIZED:
          return DioError(response: ex.response, message: "token过期", type: DioErrorType.RESPONSE);
        case FORBIDDEN:
          return DioError(response: ex.response, message: "请先登录", type: DioErrorType.RESPONSE);
        case NOT_FOUND:
          return DioError(response: ex.response, message: "HTTP NOT FOUND", type: DioErrorType.RESPONSE);
        case REQUEST_TIMEOUT:
          return DioError(response: ex.response, message: "请求超时", type: DioErrorType.RESPONSE);
        case INTERNAL_SERVER_ERROR:
          return DioError(response: ex.response, message: "内部服务器错误", type: DioErrorType.RESPONSE);
        case BAD_GATEWAY:
          return DioError(response: ex.response, message: "无效网关", type: DioErrorType.RESPONSE);
        case SERVICE_UNAVAILABLE:
          return DioError(response: ex.response, message: "找不到服务器", type: DioErrorType.RESPONSE);
        case GATEWAY_TIMEOUT:
          return DioError(response: ex.response, message: "网关超时", type: DioErrorType.RESPONSE);
      }
    }
    return DioError(response: ex.response, message: ex.message, type: DioErrorType.RESPONSE);
  }
}
