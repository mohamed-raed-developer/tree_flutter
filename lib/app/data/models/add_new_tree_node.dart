class AddNewTreeNodeModel {
  bool? success;
  Data? data;
  String? message;

  AddNewTreeNodeModel({this.success, this.data, this.message});

  AddNewTreeNodeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? parentId;
  String? title;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data({this.parentId, this.title, this.updatedAt, this.createdAt, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    parentId = json['parent_id'];
    title = json['title'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parent_id'] = parentId;
    data['title'] = title;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
