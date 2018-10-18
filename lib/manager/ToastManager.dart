import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter/widgets.dart';
//import 'package:viet_news_flutter/manager/CusToast.dart';

//toast(BuildContext context, String msg) {
//  CusToast.toast(context, msg);
//}

toasts(String msg) {
  Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
}
