import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/data/models/document.dart';
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


  List<Widget> getChildList(List<RowData> childDocuments) {

    return childDocuments.map((document) {
      if (!document.isFile!) {
        return Container(
          margin: const EdgeInsets.only(left: 8),
          child: TreeViewChild(
            parent: _getDocumentWidget(document: document),
            children: getChildList(document.childData!),
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

  Widget _getDocumentWidget({required RowData document}) => document.isFile!
      ? _getFileWidget(document: document)
      : _getDirectoryWidget(document: document);

  DirectoryWidget _getDirectoryWidget({required RowData document}) =>
      DirectoryWidget(
        directoryName: document.name!,
        lastModified: document.dateModified!,
        delete: () {
          print("delete Node");
        },
        addNode: () {
          print("add Node or files");
        },
      );

  FileWidget _getFileWidget({required RowData document}) => FileWidget(
        fileName: document.name!,
        lastModified: document.dateModified!,
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
        // Logger().e(response.data);
        allTreeNodesModel = AllTreeNodesModel.fromJson(response.data);

        },
      onError: (e) {
        Logger().e(e.message);
      },
    );
    isLoadingGetTree = false;
    update();
  }


  getChild(){

  }

  //Add New Tree Node Model and Function with api
  bool isLoadingAddNewTreeNode = false;
 AddNewTreeNodeModel? addNewTreeNodeModel;

  addPostNewTreeNode(String title, String id, int isLeaf) async {
    isLoadingAddNewTreeNode = true;
    update();
    await BaseClient.post(
      Constants.addNewTreeNodeUrl,
      headers: {
        'Authorization': 'Bearer ' + token!,
      },
      data: {
        'title': title,
        'parent_id': id,
        'is_leaf': isLeaf,
      },
      onSuccess: (response) {
        addNewTreeNodeModel = AddNewTreeNodeModel.fromJson(response.data['data']);
        Logger().e(addNewTreeNodeModel!.message);
      },
    );
    isLoadingAddNewTreeNode = false;
    update();
  }

  //update tree node with api
  bool isLoadingUpdateNode = false;
  UpdateTreeNodeModel? updateTreeNodeModel;

  updatePutTreeNode({required String title}) async {
    isLoadingUpdateNode = true;
    update();
    await BaseClient.put(
      Constants.updateTreeNodeUrl,
      headers: {
        'Authorization': 'Bearer ' + token!,
      },
      data: {
        'title': title,
      },
      onSuccess: (response) {
        updateTreeNodeModel = UpdateTreeNodeModel.fromJson(response.data);
        Logger().e(updateTreeNodeModel!.success);
      },
    );
    isLoadingUpdateNode = false;
    update();
  }

  @override
  void onInit() {
    Logger().w("message");
    getAllTreeNodes();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
