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
    } else{
      data = [];
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
  String? type;
  List<RowData>? childData;

  RowData({this.node, this.name, this.childData, this.isFile, this.type});

  RowData.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? Node.fromJson(json['node']) : null;

    //dateModified = DateTime.parse(node!.updatedAt ?? "");
    type = null;
    name = json['text'];
    childData = <RowData>[];
    if (json['children'] != []) {
      json['children'].forEach((v) {
        childData!.add(RowData.fromJson(v));
      });
    }

    if(node != null){
      for (var e in node!.attachment) {
        childData!.add(RowData(isFile: true, name: e, childData: [], type: "file"));
      }
    }

    if(node != null) {
      for (var e in node!.url) {
        childData!.add(RowData(isFile: true, name: e, childData: [], type: "url"));
      }
    }

    isFile = childData!.isEmpty;

  }

}

class Node {
  int? id;
  String? title;
  bool? isLeaf;
  String? parentId;
  late List<String> attachment;
  String? attachmentType;
  late List<String> url;
  String? attachmentDesc;

  Node(
      {this.id,
        this.title,
        this.isLeaf,
        this.parentId,
        this.attachment = const [],
        this.attachmentType,
        this.url = const [],
        this.attachmentDesc});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isLeaf = json['is_leaf'];
    parentId = json['parent_id'];
    attachment = ((json['attachment'] ?? []) as List).map((e) => e.toString()).toList();
    attachmentType = json['attachment_type'];
    url = ((json['url'] ?? []) as List).map((e) => e.toString()).toList();
    attachmentDesc = json['attachment_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = title;
    data['is_leaf'] = isLeaf;
    data['parent_id'] = parentId;
    data['attachment'] = attachment;
    data['attachment_type'] = attachmentType;
    data['url'] = url;
    data['attachment_desc'] = attachmentDesc;
    return data;
  }
}
