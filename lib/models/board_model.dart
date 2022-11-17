class Board {
  String? id;
  String? name;
  String? workspaceId;
  String? description;
  String? background;

  Board(
      {this.id,
        this.name,
        this.workspaceId,
        this.description,
        this.background});

  Board.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    workspaceId = json['workspace_id'];
    description = json['description'];
    background = json['background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['workspace_id'] = this.workspaceId;
    data['description'] = this.description;
    data['background'] = this.background;
    return data;
  }
}
