import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:viet_news_flutter/local/Local.dart';


/*
 * 国际化
 */
class NewsLocalizationsDelegate extends LocalizationsDelegate<Local>{

  const NewsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en','zh'].contains(locale.languageCode);
  }

  @override
  Future<Local> load(Locale locale) {
    return new SynchronousFuture<Local>(new Local(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<Local> old) {
    return false;
  }

  static NewsLocalizationsDelegate delegate = const NewsLocalizationsDelegate();
}
