class NotificationModel {
  String? id;
  String? uid;
  String? notifyerId;
  String? card;
  String? board;
  String? expiredtime;
  String? time;
  String? list;
  String? objectchange;
  String? type;
  String? linkTo;
  bool? seen;

  NotificationModel(
      {id,
      uid,
      notifyerId,
      card,
      board,
      expiredtime,
      time,
      list,
      objectchange,
      type,
      linkTo,
      seen});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    notifyerId = json['notifyer_id'];
    card = json['card'];
    board = json['board'];
    expiredtime = json['expired_time'];
    time = json['time'];
    list = json['list'];
    objectchange = json['object_change'];
    type = json['type'];
    linkTo = json['linkTo'];
    seen = json['seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['notifyer_id'] = notifyerId;
    data['card'] = card;
    data['board'] = board;
    data['expired_time'] = expiredtime;
    data['time'] = time;
    data['list'] = list;
    data['object_change'] = objectchange;
    data['type'] = type;
    data['linkTo'] = linkTo;
    data['seen'] = seen;
    return data;
  }
}
