import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/data/document.dart';
import 'package:getx_skeleton/app/data/models/add_new_tree_node.dart';
import 'package:getx_skeleton/app/data/models/all_tree_nodes.dart';
import 'package:getx_skeleton/app/data/models/update_tree_node.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/directory_widget.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/file_widget.dart';
import 'package:getx_skeleton/app/services/base_client.dart';
import 'package:getx_skeleton/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:tree_view/tree_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeTreeController extends GetxController {
  late final serverData;

  List<Document> documentList = [
    Document(
      name: 'Desktop',
      dateModified: DateTime.now(),
      isFile: false,
      childData: [
        Document(name: 'Projects', dateModified: DateTime.now(), childData: [
          Document(
              name: 'flutter_app',
              dateModified: DateTime.now(),
              childData: [
                Document(
                  name: 'README.md',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: 'pubspec.yaml',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: 'pubspec.lock',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: '.gitignore',
                  dateModified: DateTime.now(),
                  isFile: true,
                ),
                Document(
                  name: 'lib',
                  dateModified: DateTime.now(),
                  isFile: false,
                ),
              ])
        ]),
        Document(
          name: 'test.sh',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'image.png',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'image2.png',
          dateModified: DateTime.now(),
          isFile: true,
        ),
        Document(
          name: 'image3.png',
          dateModified: DateTime.now(),
          isFile: true,
        ),
      ],
    ),
  ];

  List<Widget> getChildList(List<Document> childDocuments) {
    return childDocuments.map((document) {
      if (!document.isFile) {
        return Container(
          margin: const EdgeInsets.only(left: 8),
          child: TreeViewChild(
            parent: _getDocumentWidget(document: document),
            children: getChildList(document.childData),
          ),
        );
      }
      return GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: _getDocumentWidget(document: document),
        ),
      );
    }).toList();
  }

  Widget _getDocumentWidget({required Document document}) => document.isFile
      ? _getFileWidget(document: document)
      : _getDirectoryWidget(document: document);

  DirectoryWidget _getDirectoryWidget({required Document document}) =>
      DirectoryWidget(
        directoryName: document.name,
        lastModified: document.dateModified,
        delete: () {
          print("delete Node");
        },
        addNode: () {
          print("add Node or files");
        },
      );

  FileWidget _getFileWidget({required Document document}) => FileWidget(
        fileName: document.name,
        lastModified: document.dateModified,
        hasDelete: true,
        onDelete: () {
          print("delete file");
        },
      );

  //Get All Tree Node Model and Function with api
  bool isLoadingGetTree = false;
  AllTreeNodesModel? allTreeNodesModel;

  getAllTreeNodes() async {
    isLoadingGetTree = true;
    update();
    await BaseClient.get(
      Constants.getTreeNodeUrl,
      headers: {
        'Authorization': 'Bearer ' + token!,
      },
      onSuccess: (response) {
        allTreeNodesModel = AllTreeNodesModel.fromJson(response.data);
        Logger().e(allTreeNodesModel!.message);
        Logger().e(allTreeNodesModel!.data![0].text);
        Logger().e(allTreeNodesModel!.data![0].children![0].text);
      },
      onError: (e) {
        Logger().e(e.message);
      },
    );
    isLoadingGetTree = false;
    update();
  }

  //Add New Tree Node Model and Function with api
  bool isLoadingAddNewTreeNode = false;
  AddNewTreeNodeModel? addNewTreeNodeModel;

  addPostNewTreeNode() async {
    isLoadingAddNewTreeNode = true;
    update();
    await BaseClient.post(
      Constants.addNewTreeNodeUrl,
      headers: {
        'Authorization': 'Bearer ' + token!,
      },
      data: {
        'title': '',
        'parent_id': 21,
        'is_leaf': 0,
      },
      onSuccess: (response) {
        addNewTreeNodeModel = AddNewTreeNodeModel.fromJson(response.data);
        Logger().e(addNewTreeNodeModel!.message);
      },
    );
    isLoadingAddNewTreeNode = false;
    update();
  }

  //update tree node with api
  bool isLoadingUpdateNode = false;
  UpdateTreeNodeModel? updateTreeNodeModel;

  updatePutTreeNode() async {
    isLoadingUpdateNode = true;
    update();
    await BaseClient.put(
      Constants.updateTreeNodeUrl,
      headers: {
        'Authorization': 'Bearer ' + token!,
      },
      onSuccess: (response) {},
    );
  }

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        getAllTreeNodes();
      },
    );
    // getAllTreeNodes();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
