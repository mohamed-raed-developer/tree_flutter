import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tree/flutter_tree.dart';
import 'package:get/get.dart';

class HomeTreeController extends GetxController {
  late final serverData ;
  final TextEditingController linkController = TextEditingController();

  /// Map server data to tree node data
  TreeNodeData mapServerDataToTreeData(Map data) {
    return TreeNodeData(
      extra: data,
      title: data['text'],
      expaned: data['show'],
      checked: data['checked'],
      children:
      List.from(data['children'].map((x) => mapServerDataToTreeData(x))),
    );
  }

  /// Generate tree data
  late List<TreeNodeData> treeData ;

  File? pdfprofile;
  File? videoProfile;
  String? nameFile;
  String? nameVideo;

  void chooseFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result != null) {
      final path = result.files.single.path!;
      final name = result.files.single.name;

      pdfprofile = File(path);
      nameFile = name;
      update();
      log(nameFile!);
    }
  }

  void chooseVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
    );
    if (result != null) {
      final path = result.files.single.path!;
      final name = result.files.single.name;

      videoProfile = File(path);
      nameVideo = name;
      update();
      log(nameVideo!);
    }
  }


  @override
  void onInit() {
    serverData = [
      {
        "checked": true,
        "children": [
          {
            "checked": true,
            "show": false,
            "children": [],
            "id": 11,
            "pid": 1,
            "text": "word & pdf",
          },
          {
            "checked": true,
            "show": false,
            "children": [],
            "id": 11,
            "pid": 1,
            "text": "Video",
          },
          {
            "checked": true,
            "show": false,
            "children": [],
            "id": 11,
            "pid": 1,
            "text": "link",
          },
        ],
        "id": 1,
        "pid": 0,
        "show": false,
        "text": "Main",
      },
    ];

    treeData = List.generate(
      serverData.length,
          (index) => mapServerDataToTreeData(serverData[index]),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    linkController.dispose();
  }
}
