import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:getx_skeleton/app/components/bottom_sheet.dart';
import 'package:getx_skeleton/app/data/models/all_tree_nodes.dart';
import 'package:getx_skeleton/app/data/models/update_tree_node.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/directory_widget.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/file_widget.dart';
import 'package:getx_skeleton/app/services/base_client.dart';
import 'package:getx_skeleton/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:tree_view/tree_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

import '../../../components/custom_dialog.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../components/custom_snackbar.dart';

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
        addNode: (String type) async {
          if(type == 'folder'){
            showAddNodeDialog(okPress: (String title){
              addNewTreeNode(title, document.node!.id!, 0);
            });
          }else if(type == 'files'){
            FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

            if (result != null) {
              addNewFilesNode(result.paths, document.node!.id!, 0);
            } else {
              // User canceled the picker
            }
          }else if(type == 'url'){
            BottomSheetUtils.showAgreementBottomSheet(Get.context, (tags){
              Get.back();
             addNewUrlNode(tags, document.node!.id!, 0);
            });

          }else if(type == 'edit'){
            showEditNodeDialog(
                okPress: (String title){
                  updateTreeNode(title: title, parentId: document.node!.id!);
                }
            );
          }else if(type == 'delete'){
            showDeleteNodeDialog(
                okPress: (){
                  deleteTreeNode(id: document.node!.id!);
                }
            );
          }
        },
      );

  FileWidget _getFileWidget({required RowData document}) => FileWidget(
        fileName: document.name!,
        attachmentType: document.node?.attachmentType ?? document.type!,
        hasDelete: true,
        onDelete: () {
          print("delete file");
        },
      );

  //Get All Tree Node Model and Function with api
  bool isLoadingGetTree = false;
  AllTreeNodesModel? allTreeNodesModel;


  addNewFilesNode(List<String?> paths, int id, int isLeaf) async {

    final map ={
      'node_id': id,
      'attachment_type': 'file',
    };

    for(int i = 0 ; i < paths.length ; i++){
      map['attachment_files[$i]'] = await MultipartFile.fromFile(paths[i]!, filename: paths[i]!.split('/').last);
    }

    final body = FormData.fromMap(
        map
    );

    Logger().w(body);

    showLoadingOverLay(
        asyncFunction: () async =>
        await BaseClient.post(
            Constants.addDetailsNodeUrl,
            headers: {
              'Authorization': 'Bearer ' + token!,
              'Content-Type': 'multipart/form-data',
            },
            data: body,
            onSuccess: (response) {
              Logger().e(response);
              // AddNewTreeNodeModel? addNewTreeNodeModel = AddNewTreeNodeModel.fromJson(response.data['data']);
              getAllTreeNodes();
            },
            onError: (e){
              Logger().e(e.response);
              Logger().e(e.url);
              Logger().e(e.message);
              Logger().e(e.statusCode);
            }
        )
    );
    update();
  }

  addNewUrlNode(List<String> urls, int id, int isLeaf) async {

    final map ={
      'node_id': id,
      'attachment_type': 'url',
    };

    for(int i = 0 ; i < urls.length ; i++){
      map['attachment_urls[$i]'] = urls[i];
    }


    final body = FormData.fromMap(
        map
     // 'File': isFileMessage ? await MultipartFile.fromFile(pickedFile!.path, filename: pickedFile!.path.split('/').last) : null,
    );


    Logger().w(body);

    showLoadingOverLay(
        asyncFunction: () async =>
        await BaseClient.post(
            Constants.addDetailsNodeUrl,
            headers: {
              'Authorization': 'Bearer ' + token!,
              'Content-Type': 'multipart/form-data',
            },
            data: body,
            onSuccess: (response) {
              Logger().e(response);
              // AddNewTreeNodeModel? addNewTreeNodeModel = AddNewTreeNodeModel.fromJson(response.data['data']);
              getAllTreeNodes();
            },
            onError: (e){
              Logger().e(e);
            }
        )
    );

    update();
  }

  getAllTreeNodes() async {
    isLoadingGetTree = true;
    update();

    await BaseClient.get(
      Constants.getTreeNodeUrl,
      headers: {
        'Authorization': 'Bearer ' + token!,
      },
      onSuccess: (response) {
         Logger().e(response.data);
           allTreeNodesModel = AllTreeNodesModel.fromJson(response.data);
        },
      onError: (e) {
        Logger().e(e.message);
      },
    );
    isLoadingGetTree = false;
    update();
  }


  //Add New Tree Node Model and Function with api

  addNewTreeNode(String title, int id, int isLeaf) async {
    showLoadingOverLay(
        asyncFunction: () async => await BaseClient.post(
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
            Logger().e(response);
            // AddNewTreeNodeModel? addNewTreeNodeModel = AddNewTreeNodeModel.fromJson(response.data['data']);
            getAllTreeNodes();
          },
        )
    );
    ;
    update();
  }

  //update tree node with api
  UpdateTreeNodeModel? updateTreeNodeModel;

  updateTreeNode({required String title ,required int parentId}) async {
    showLoadingOverLay(
        asyncFunction: () async =>
        await BaseClient.put(
          Constants.updateTreeNodeUrl + "/$parentId",
          headers: {
            'Authorization': 'Bearer ' + token!,
          },
          data: {
            'title': title,
          },
          onSuccess: (response) {
            getAllTreeNodes();
            Logger().e(response);
          },
          onError: (e){
            Logger().e(e);
          }

        )
    );
    update();
  }

  deleteTreeNode({required int id}) async {
    showLoadingOverLay(asyncFunction: () async => await BaseClient.delete(
        Constants.deleteTreeNodeUrl,
        queryParameters: {
          "node_id" : id
        },
        headers: {
          'Authorization': 'Bearer ' + token!,
        },
        onSuccess: (response) {
          Logger().e(response);
          CustomSnackBar.showCustomErrorSnackBar(title: "Delete", message: response.data['message'] ?? '');
          getAllTreeNodes();
        },
        onError: (error){
          Logger().e(error);
        }
    ));
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
