import 'package:viet_news_flutter/http/APIService.dart';
import 'package:viet_news_flutter/http/fetch.dart';
import 'package:viet_news_flutter/model/VerifyCodeTypeEnum.dart';

class RegisterViewModel {

  getContentList() {
    final params = {"page_number": 1, "page_size": "10", "channel_id": 3};
    Fetch.init
        .post(ApiService.list4Channel, data: params)
        .then((response) => print("success: $response"))
        .catchError((error) => print("error: $error"));
  }

  sendSms(String text) {
    Fetch.init
        .post(ApiService.sendSMS, data: {
          "validation_code_type": VerifyCodeTypeEnum.REGISTER.toString(),
          "zone_code": "86",
          "phone_number": text
        })
        .then((response) => print("success: $response"));
  }

  Future<dynamic> register(String number, String code,String inviteCode) {
    return Fetch.init
        .post(ApiService.register, data: {
          "zone_code": "86",
          "verify_code": code,
          "invite_code": inviteCode,
          "phone_number": number
        });
  }
}
