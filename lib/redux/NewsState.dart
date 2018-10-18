import 'dart:ui';
import 'package:viet_news_flutter/redux/LocalRedux.dart';

class NewsState {
  Locale locale;
  ///当前手机平台默认语言
  Locale platformLocale;

  NewsState({this.locale});
}

NewsState appReducer(NewsState state, action) {
  return NewsState(
    ///通过 LocaleReducer 将 State 内的 locale 和 action 关联在一起
    locale: LocaleReducer(state.locale, action),
  );
}
