import 'package:fluttertoast/fluttertoast.dart';

toast(String msg) {
  Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
}
