class WorkspaceParticipant {
  String? userId;
  String? workspaceId;
  String? role;

  WorkspaceParticipant({this.userId, this.workspaceId, this.role});

  WorkspaceParticipant.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    workspaceId = json['workspace_id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['workspace_id'] = workspaceId;
    data['role'] = role;
    return data;
  }
}
