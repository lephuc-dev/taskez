class User {
  String? uid;
  String? email;
  String? avatar;
  String? name;

  User({this.uid, this.email, this.avatar, this.name});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    avatar = json['avatar'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['avatar'] = avatar;
    data['name'] = name;
    return data;
  }
}
