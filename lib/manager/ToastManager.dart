//import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/widgets.dart';
import 'package:viet_news_flutter/manager/Toast.dart';

toast(BuildContext context, String msg) {
//  Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  Toast.toast(context, msg);
}
