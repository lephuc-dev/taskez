class Board {
  String? id;
  String? name;
  String? description;
  String? background;
  String? workspaceId;

  Board({this.id, this.name, this.description, this.background, this.workspaceId});

  Board.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    background = json['background'];
    workspaceId = json['workspace_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['background'] = background;
    data['workspace_id'] = workspaceId;
    return data;
  }
}
