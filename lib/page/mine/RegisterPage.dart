import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/manager/ToastManager.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/view/NextRegisterWidget.dart';
import 'package:viet_news_flutter/view/RegisterWidget.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterStatus();
}

bool next = false;

class _RegisterStatus extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    if (next) {
      return WillPopScope(
        onWillPop: _requestPop,
        child: NextRegisterWidget(),
      );
    }
    return RegisterWidget(onNextClick: () {
      setState(() => next = true);
    });
  }

  Future<bool> _requestPop() {
    setState(() => next = false);
    return Future.value(false);
  }
}
