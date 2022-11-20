class ProjectParticipant {
  String? role;
  String? userId;
  String? projectId;

  ProjectParticipant({this.role, this.userId, this.projectId});

  ProjectParticipant.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    userId = json['user_id'];
    projectId = json['project_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['user_id'] = userId;
    data['project_id'] = projectId;
    return data;
  }
}
