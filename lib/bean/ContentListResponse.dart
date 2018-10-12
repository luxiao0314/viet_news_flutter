import 'dart:convert' show json;

class ContentListResponse {

  int code;
  String message;
  ContentListResponseData data;

  ContentListResponse.fromParams({this.code, this.message, this.data});

  factory ContentListResponse(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ContentListResponse.fromJson(json.decode(jsonStr)) : new ContentListResponse.fromJson(jsonStr);

  ContentListResponse.fromJson(jsonRes) {
    code = jsonRes['code'];
    message = jsonRes['message'];
    data = jsonRes['data'] == null ? null : new ContentListResponseData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"message": ${message != null?'${json.encode(message)}':'null'},"data": $data}';
  }
}

class ContentListResponseData {

  int total_count;
  int total_pages;
  List<ContentListResponseList> list;

  ContentListResponseData.fromParams({this.total_count, this.total_pages, this.list});

  ContentListResponseData.fromJson(jsonRes) {
    total_count = jsonRes['total_count'];
    total_pages = jsonRes['total_pages'];
    list = jsonRes['list'] == null ? null : [];

    for (var listItem in list == null ? [] : jsonRes['list']){
      list.add(listItem == null ? null : new ContentListResponseList.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"total_count": $total_count,"total_pages": $total_pages,"list": $list}';
  }
}

class ContentListResponseList {

  List<ContentListResponseImages> image_array;
  ContentListResponseAuthor author;
  ContentListResponseContent content;

  ContentListResponseList.fromParams({this.image_array, this.author, this.content});

  ContentListResponseList.fromJson(jsonRes) {
    image_array = jsonRes['image_array'] == null ? null : [];

    for (var image_arrayItem in image_array == null ? [] : jsonRes['image_array']){
      image_array.add(image_arrayItem == null ? null : new ContentListResponseImages.fromJson(image_arrayItem));
    }

    author = jsonRes['author'] == null ? null : new ContentListResponseAuthor.fromJson(jsonRes['author']);
    content = jsonRes['content'] == null ? null : new ContentListResponseContent.fromJson(jsonRes['content']);
  }

  @override
  String toString() {
    return '{"image_array": $image_array,"author": $author,"content": $content}';
  }
}

class ContentListResponseContent {

  var collection_number;
  var content_profit;
  var content_type;
  var createDateTime;
  var id;
  var like_number;
  var updateDateTime;
  var user_id;
  var version;
  var view_number;
  bool collection_flag;
  bool like_flag;
  String content_detail;
  String content_image;
  String content_title;

  ContentListResponseContent.fromParams({this.collection_number, this.content_profit, this.content_type, this.createDateTime, this.id, this.like_number, this.updateDateTime, this.user_id, this.version, this.view_number, this.collection_flag, this.like_flag, this.content_detail, this.content_image, this.content_title});

  ContentListResponseContent.fromJson(jsonRes) {
    collection_number = jsonRes['collection_number'];
    content_profit = jsonRes['content_profit'];
    content_type = jsonRes['content_type'];
    createDateTime = jsonRes['createDateTime'];
    id = jsonRes['id'];
    like_number = jsonRes['like_number'];
    updateDateTime = jsonRes['updateDateTime'];
    user_id = jsonRes['user_id'];
    version = jsonRes['version'];
    view_number = jsonRes['view_number'];
    collection_flag = jsonRes['collection_flag'];
    like_flag = jsonRes['like_flag'];
    content_detail = jsonRes['content_detail'];
    content_image = jsonRes['content_image'];
    content_title = jsonRes['content_title'];
  }

  @override
  String toString() {
    return '{"collection_number": $collection_number,"content_profit": $content_profit,"content_type": $content_type,"createDateTime": $createDateTime,"id": $id,"like_number": $like_number,"updateDateTime": $updateDateTime,"user_id": $user_id,"version": $version,"view_number": $view_number,"collection_flag": $collection_flag,"like_flag": $like_flag,"content_detail": ${content_detail != null?'${json.encode(content_detail)}':'null'},"content_image": ${content_image != null?'${json.encode(content_image)}':'null'},"content_title": ${content_title != null?'${json.encode(content_title)}':'null'}}';
  }
}

class ContentListResponseAuthor {

  Object fans_count;
  Object follow_count;
  Object follow_flag;
  Object is_bind;
  Object is_set_password;
  Object login_type;
  Object self_flag;
  Object zone_code;
  int id;
  String avatar;
  String invite_code;
  String nick_name;
  String phone_number;

  ContentListResponseAuthor.fromParams({this.fans_count, this.follow_count, this.follow_flag, this.is_bind, this.is_set_password, this.login_type, this.self_flag, this.zone_code, this.id, this.avatar, this.invite_code, this.nick_name, this.phone_number});

  ContentListResponseAuthor.fromJson(jsonRes) {
    fans_count = jsonRes['fans_count'];
    follow_count = jsonRes['follow_count'];
    follow_flag = jsonRes['follow_flag'];
    is_bind = jsonRes['is_bind'];
    is_set_password = jsonRes['is_set_password'];
    login_type = jsonRes['login_type'];
    self_flag = jsonRes['self_flag'];
    zone_code = jsonRes['zone_code'];
    id = jsonRes['id'];
    avatar = jsonRes['avatar'];
    invite_code = jsonRes['invite_code'];
    nick_name = jsonRes['nick_name'];
    phone_number = jsonRes['phone_number'];
  }

  @override
  String toString() {
    return '{"fans_count": $fans_count,"follow_count": $follow_count,"follow_flag": $follow_flag,"is_bind": $is_bind,"is_set_password": $is_set_password,"login_type": $login_type,"self_flag": $self_flag,"zone_code": $zone_code,"id": $id,"avatar": ${avatar != null?'${json.encode(avatar)}':'null'},"invite_code": ${invite_code != null?'${json.encode(invite_code)}':'null'},"nick_name": ${nick_name != null?'${json.encode(nick_name)}':'null'},"phone_number": ${phone_number != null?'${json.encode(phone_number)}':'null'}}';
  }
}

class ContentListResponseImages {

  String cover;

  ContentListResponseImages.fromParams({this.cover});

  ContentListResponseImages.fromJson(jsonRes) {
    cover = jsonRes['cover'];
  }

  @override
  String toString() {
    return '{"cover": ${cover != null?'${json.encode(cover)}':'null'}}';
  }
}

