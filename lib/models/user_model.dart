class UserModel {
  UserModel(
      {required this.email,
      required this.name,
      required this.avatar,
      required this.uid});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          email: json['email']! ?? "",
          name: json['name']! ?? "",
          avatar: json['avatar']! ?? "",
          uid: json['avatar']! ?? "",
        );

  final String email;
  final String name;
  final String avatar;
  final String uid;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;
    data['name'] = name;
    data['avatar'] = avatar;
    data['uid'] = uid;
    return data;
  }
}
