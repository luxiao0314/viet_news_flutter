class BaseResponse<T> {
  int code = 0;
  String message = "";
  T data;
}
