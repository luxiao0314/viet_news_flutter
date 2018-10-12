import 'dart:convert';

class ChannelBean {
  int createDateTime;
  int id;
  int sort;
  int updateDateTime;
  int version;
  bool can_delete;
  bool default_channel;
  String channel_key;
  String channel_name;

  ChannelBean.fromParams(
      {this.createDateTime,
      this.id,
      this.sort,
      this.updateDateTime,
      this.version,
      this.can_delete,
      this.default_channel,
      this.channel_key,
      this.channel_name});

  ChannelBean.fromJson(jsonRes) {
    createDateTime = jsonRes['createDateTime'];
    id = jsonRes['id'];
    sort = jsonRes['sort'];
    updateDateTime = jsonRes['updateDateTime'];
    version = jsonRes['version'];
    can_delete = jsonRes['can_delete'];
    default_channel = jsonRes['default_channel'];
    channel_key = jsonRes['channel_key'];
    channel_name = jsonRes['channel_name'];
  }

  @override
  String toString() {
    return '{"createDateTime": $createDateTime,"id": $id,"sort": $sort,"updateDateTime": $updateDateTime,"version": $version,"can_delete": $can_delete,"default_channel": $default_channel,"channel_key": ${channel_key != null ? '${json.encode(channel_key)}' : 'null'},"channel_name": ${channel_name != null ? '${json.encode(channel_name)}' : 'null'}}';
  }
}
