class UserModel {
  UserModel(
      {required this.email,
      required this.name,
      required this.avatar,
      required this.uid});

  UserModel.fromJson(Map<String, Object?> json)
      : this(
          email: json['email']! as String,
          name: json['name']! as String,
          avatar: json['avatar']! as String,
          uid: json['avatar']! as String,
        );

  final String email;
  final String name;
  final String avatar;
  final String uid;

  Map<String, Object?> toJson() {
    return {
      'email': email,
      'name': name,
      'avatar': avatar,
      'uid': uid,
    };
  }
}
