import 'dart:convert' show json;

class FavoriteListResponse {

  int code;
  String message;
  FavoriteListResponseData data;

  FavoriteListResponse.fromParams({this.code, this.message, this.data});

  factory FavoriteListResponse(jsonStr) => jsonStr == null ? null : jsonStr is String ? new FavoriteListResponse.fromJson(json.decode(jsonStr)) : new FavoriteListResponse.fromJson(jsonStr);

  FavoriteListResponse.fromJson(jsonRes) {
    code = jsonRes['code'];
    message = jsonRes['message'];
    data = jsonRes['data'] == null ? null : new FavoriteListResponseData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"message": ${message != null?'${json.encode(message)}':'null'},"data": $data}';
  }
}

class FavoriteListResponseData {

  int total_count;
  int total_pages;
  List<FavoriteData> list;

  FavoriteListResponseData.fromParams({this.total_count, this.total_pages, this.list});

  FavoriteListResponseData.fromJson(jsonRes) {
    total_count = jsonRes['total_count'];
    total_pages = jsonRes['total_pages'];
    list = jsonRes['list'] == null ? null : [];

    for (var listItem in list == null ? [] : jsonRes['list']){
      list.add(listItem == null ? null : new FavoriteData.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"total_count": $total_count,"total_pages": $total_pages,"list": $list}';
  }
}

class FavoriteData {

  List<FavoriteCover> image_array;
  Author author;
  Content content;

  FavoriteData.fromParams({this.image_array, this.author, this.content});

  FavoriteData.fromJson(jsonRes) {
    image_array = jsonRes['image_array'] == null ? null : [];

    for (var image_arrayItem in image_array == null ? [] : jsonRes['image_array']){
      image_array.add(image_arrayItem == null ? null : new FavoriteCover.fromJson(image_arrayItem));
    }

    author = jsonRes['author'] == null ? null : new Author.fromJson(jsonRes['author']);
    content = jsonRes['content'] == null ? null : new Content.fromJson(jsonRes['content']);
  }

  @override
  String toString() {
    return '{"image_array": $image_array,"author": $author,"content": $content}';
  }
}

class Content {

  int collection_number;
  double content_profit;
  int content_type;
  int createDateTime;
  int id;
  int like_number;
  int updateDateTime;
  int user_id;
  int version;
  int view_number;
  bool collection_flag;
  bool like_flag;
  String content_detail;
  String content_image;
  String content_title;

  Content.fromParams({this.collection_number, this.content_profit, this.content_type, this.createDateTime, this.id, this.like_number, this.updateDateTime, this.user_id, this.version, this.view_number, this.collection_flag, this.like_flag, this.content_detail, this.content_image, this.content_title});

  Content.fromJson(jsonRes) {
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

class Author {

  int fans_count;
  int follow_count;
  double follow_flag;
  double is_bind;
  bool is_set_password;
  int login_type;
  bool self_flag;
  int zone_code;
  int id;
  String avatar;
  String invite_code;
  String nick_name;
  String phone_number;

  Author.fromParams({this.fans_count, this.follow_count, this.follow_flag, this.is_bind, this.is_set_password, this.login_type, this.self_flag, this.zone_code, this.id, this.avatar, this.invite_code, this.nick_name, this.phone_number});

  Author.fromJson(jsonRes) {
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

class FavoriteCover {

  String cover;

  FavoriteCover.fromParams({this.cover});

  FavoriteCover.fromJson(jsonRes) {
    cover = jsonRes['cover'];
  }

  @override
  String toString() {
    return '{"cover": ${cover != null?'${json.encode(cover)}':'null'}}';
  }
}

