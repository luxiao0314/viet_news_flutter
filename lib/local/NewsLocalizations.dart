
import 'dart:ui';

import 'package:flutter/cupertino.dart';

/*
 * 国际化
 */
class NewsLocalizations {

  final Locale locale;

  NewsLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'find': 'Find',
      'follow': 'Follow',
      'task': 'Task',
      'mine':'Mine'
    },
    'zh': {
      'find': '发现',
      'follow': '订阅',
      'task': '任务',
      'mine':'我的'
    }
  };

  get find{
    return _localizedValues[locale.languageCode]['find'];
  }

  get follow{
    return _localizedValues[locale.languageCode]['follow'];
  }

  get task{
    return _localizedValues[locale.languageCode]['task'];
  }

  get mine{
    return _localizedValues[locale.languageCode]['mine'];
  }

  static NewsLocalizations of(BuildContext context){
    return Localizations.of(context, NewsLocalizations);
  }
}
