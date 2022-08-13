import 'package:logger/logger.dart';

class AllTreeNodesModel {
  bool? success;
  List<RowData>? data;
  String? message;

  AllTreeNodesModel({this.success, this.data, this.message});

  AllTreeNodesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = (json['data'] as List).map((e) => RowData.fromJson(e)).toList();
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    data['message'] = message;
    return data;
  }
}

class RowData {
  Node? node;
  String? name;
  bool? isFile;
  DateTime? dateModified;
  List<RowData>? childData;

  RowData({this.node, this.name, this.childData, this.isFile, this.dateModified});

  RowData.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
    isFile = false;
    // dateModified = DateTime.parse(node!.updatedAt!);
    dateModified = DateTime.now();
    name = json['text'];
    childData = <RowData>[];
    if (json['children'] != null) {
      json['children'].forEach((v) {
        childData!.add(RowData.fromJson(v));
      });
    }
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
