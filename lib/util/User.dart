import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class User {
  static final String IS_LOGIN_KEY = "isLogin";
  static final String USERNAME_KEY = "userName";

  static final User _currentUser = new User._internal();

  SharedPreferences _sp;

  factory User() {
    return _currentUser;
  }

  User._internal() {
    init();
  }

  init() async {
    _sp = await SharedPreferences.getInstance();
  }

  // 保存用户登录信息，data中包含了userName
  Future saveLoginInfo(String userName) async {
    print('isLogin');
    await _sp.setString(USERNAME_KEY, userName);
    await _sp.setBool(IS_LOGIN_KEY, true);
  }

  Future clearLoginInfo() async {
    print('clean');
    return _sp.clear();
  }

  Future<String> getUserName() async {
    return _sp.getString(USERNAME_KEY);
  }

  Future<bool> isLogin() async {
    bool b = _sp.getBool(IS_LOGIN_KEY);
    return true == b;
  }
}
