import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:viet_news_flutter/local/NewsLocalizations.dart';


/*
 * 国际化
 */
class NewsLocalizationsDelegate extends LocalizationsDelegate<NewsLocalizations>{

  const NewsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en','zh'].contains(locale.languageCode);
  }

  @override
  Future<NewsLocalizations> load(Locale locale) {
    return new SynchronousFuture<NewsLocalizations>(new NewsLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<NewsLocalizations> old) {
    return false;
  }

  static NewsLocalizationsDelegate delegate = const NewsLocalizationsDelegate();
}
