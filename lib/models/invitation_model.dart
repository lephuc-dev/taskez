class InvitationModel {
  String? id;
  String? inviteeId;
  String? inviterId;
  String? role;
  String? status;
  String? time;
  String? workspaceId;

  InvitationModel(
      {id,
      inviteeId,
      inviterId,
      role,
      status,
      time,
      workspaceId});

  InvitationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inviteeId = json['invitee_id'];
    inviterId = json['inviter_id'];
    role = json['role'];
    status = json['status'];
    time = json['time'];
    workspaceId = json['workspace_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['invitee_id'] = inviteeId;
    data['inviter_id'] = inviterId;
    data['role'] = role;
    data['status'] = status;
    data['time'] = time;
    data['workspace_id'] = workspaceId;
    return data;
  }
}