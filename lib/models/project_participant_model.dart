class ProjectParticipant {
  String? role;
  String? userId;
  String? projectId;
  bool? favorite;

  ProjectParticipant({this.role, this.userId, this.projectId, this.favorite});

  ProjectParticipant.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    userId = json['user_id'];
    projectId = json['project_id'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['user_id'] = userId;
    data['project_id'] = projectId;
    data['favorite'] = favorite;
    return data;
  }
}
