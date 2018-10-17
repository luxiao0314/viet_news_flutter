import 'package:dio/dio.dart';

class ApiService {

  //测试环境
  static final String baseUrl = "http://magicbox.liaoyantech.cn/magicbox/api/";

  ///发送短信
  static final String sendSMS = "v1/login/sendSms";

  ///登录
  static final String login = "v1/login/login";

  ///注册
  static final String register = "v1/login/register";

  /// 获取首页内容 根据不同的参数
  static final String list4Channel = "v1/content/list4Channel";

  ///频道列表
  static final String channelList = "v1/channel/list";

  ///所有频道列表
  static final String allList = "v1/channel/allList";

  /// 用户给某一篇文章点赞
  static final String like = "v1/content/like/";

  /// 用户收藏一篇文章
  static final String collection = "v1/content/collection/";

  /// 提交频道排序结果
  static final String updateSort = "v1/channel/updateSort";

  ///关注
  static final String list4follow = "v1/content/list4follow";

  ///收藏列表
  static final String list4collection = "v1/content/collectionList";

}
