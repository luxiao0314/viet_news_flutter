import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:viet_news_flutter/res/StringEn.dart';
import 'package:viet_news_flutter/res/StringZh.dart';

/*
 * 国际化
 */
class Local {
  final Locale locale;

  Local(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  static Map<String, StringEn> _localizedValues = {
    'en': new StringEn(),
    'zh': new StringZh(),
  };

  StringEn get _currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  static StringEn of(BuildContext context) {
    return Localizations.of(context, Local)._currentLocalized;
  }
}
