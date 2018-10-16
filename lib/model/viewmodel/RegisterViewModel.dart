import 'package:viet_news_flutter/http/APIService.dart';
import 'package:viet_news_flutter/http/fetch.dart';

class RegisterViewModel {
  register() {
    final params = {
      "page_number": 17602129432,
      "verify_code": 0314,
    };
    Fetch.init
        .post(ApiService.register, data: params)
        .then((response) => print("success: $response"))
        .catchError((error) => print("error: $error"));
  }

  getContentList(){
    final params = {
      "page_number": 1,
      "page_size": "10",
      "channel_id": 3
    };
    Fetch.init
        .post(ApiService.list4Channel, data: params)
        .then((response) => print("success: $response"))
        .catchError((error) => print("error: $error"));
  }
}
