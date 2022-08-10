class AllTreeNodesModel {
  bool? success;
  List<Data>? data;
  String? message;

  AllTreeNodesModel({this.success, this.data, this.message});

  AllTreeNodesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  Node? node;
  String? text;
  List<Children>? children;

  Data({this.node, this.text, this.children});

  Data.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
    text = json['text'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (node != null) {
      data['node'] = node!.toJson();
    }
    data['text'] = text;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Node {
  String? rn;
  int? id;
  String? title;
  bool? isLeaf;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  String? attachment;
  String? attachmentType;
  String? url;
  String? attachmentDesc;

  Node(
      {this.rn,
        this.id,
        this.title,
        this.isLeaf,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.attachment,
        this.attachmentType,
        this.url,
        this.attachmentDesc});

  Node.fromJson(Map<String, dynamic> json) {
    rn = json['rn'];
    id = json['id'];
    title = json['title'];
    isLeaf = json['is_leaf'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    attachment = json['attachment'];
    attachmentType = json['attachment_type'];
    url = json['url'];
    attachmentDesc = json['attachment_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rn'] = rn;
    data['id'] = id;
    data['title'] = title;
    data['is_leaf'] = isLeaf;
    data['parent_id'] = parentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['attachment'] = attachment;
    data['attachment_type'] = attachmentType;
    data['url'] = url;
    data['attachment_desc'] = attachmentDesc;
    return data;
  }
}

class Node1 {
  String? rn;
  int? id;
  String? title;
  bool? isLeaf;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  String? attachment;
  String? attachmentType;
  String? url;
  String? attachmentDesc;

  Node1(
      {this.rn,
        this.id,
        this.title,
        this.isLeaf,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.attachment,
        this.attachmentType,
        this.url,
        this.attachmentDesc});

  Node1.fromJson(Map<String, dynamic> json) {
    rn = json['rn'];
    id = json['id'];
    title = json['title'];
    isLeaf = json['is_leaf'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    attachment = json['attachment'];
    attachmentType = json['attachment_type'];
    url = json['url'];
    attachmentDesc = json['attachment_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rn'] = rn;
    data['id'] = id;
    data['title'] = title;
    data['is_leaf'] = isLeaf;
    data['parent_id'] = parentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['attachment'] = attachment;
    data['attachment_type'] = attachmentType;
    data['url'] = url;
    data['attachment_desc'] = attachmentDesc;
    return data;
  }
}

class Node2 {
  String? rn;
  int? id;
  String? title;
  bool? isLeaf;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  String? attachment;
  String? attachmentType;
  String? url;
  String? attachmentDesc;

  Node2(
      {this.rn,
        this.id,
        this.title,
        this.isLeaf,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.attachment,
        this.attachmentType,
        this.url,
        this.attachmentDesc});

  Node2.fromJson(Map<String, dynamic> json) {
    rn = json['rn'];
    id = json['id'];
    title = json['title'];
    isLeaf = json['is_leaf'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    attachment = json['attachment'];
    attachmentType = json['attachment_type'];
    url = json['url'];
    attachmentDesc = json['attachment_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rn'] = rn;
    data['id'] = id;
    data['title'] = title;
    data['is_leaf'] = isLeaf;
    data['parent_id'] = parentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['attachment'] = attachment;
    data['attachment_type'] = attachmentType;
    data['url'] = url;
    data['attachment_desc'] = attachmentDesc;
    return data;
  }
}

class Children {
  Node? node;
  String? text;
  List<Null>? children;

  Children({this.node, this.text, this.children});

  Children.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
    text = json['text'];
    if (json['children'] != null) {
      children = <Null>[];
      // json['children'].forEach((v) {
      //   children!.add(Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (node != null) {
      data['node'] = node!.toJson();
    }
    data['text'] = text;
    if (children != null) {
      // data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}