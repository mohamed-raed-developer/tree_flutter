import 'package:flutter/material.dart';
import 'package:flutter_tree/flutter_tree.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/widget/bottom_sheet_widget.dart';

import '../controllers/home_tree_controller.dart';

class HomeTreeView extends GetView<HomeTreeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeTreeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeTreeView'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeTreeController>(
        builder: (_) => Center(
          child: TreeView(
            data: controller.treeData,
            showActions: true,
            append: (parent) {
              if (parent.title == 'word & pdf') {
                bottomSheet(
                    context: context,
                    isLink: false,
                    nameChoose: controller.nameFile ?? 'No file selected',
                    choose: 'Choose a file',
                    onPressButton: () {
                      controller.chooseFile();
                    });
                return TreeNodeData(
                  children: [],
                  title: controller.nameFile ?? '',
                  expaned: false,
                  checked: false,
                );
              } else if (parent.title == 'link') {
                print('Add link file');
                bottomSheet(
                  context: context,
                  nameChoose: controller.linkController != null
                      ? controller.linkController.text
                      : 'No Link',
                  isLink: true,
                  choose: 'Add a link youtube',
                  controller: controller.linkController,
                  onPressButton: () {
                    //save link
                  },
                );
                return TreeNodeData(
                  children: [],
                  title: controller.linkController != null
                      ? controller.linkController.text
                      : '',
                  expaned: false,
                  checked: false,
                );
              } else if (parent.title == 'Video') {
                print('Add Video');
                bottomSheet(
                  context: context,
                  nameChoose: controller.nameFile ?? 'No Video selected',
                  isLink: false,
                  choose: 'Add a Video',
                  onPressButton: () {
                    controller.chooseVideo();
                  },
                );
              } else {
                return TreeNodeData(
                  children: [],
                  title: '',
                  expaned: false,
                  checked: false,
                );
              }
              return TreeNodeData(
                children: [],
                title: '',
                expaned: false,
                checked: false,
              );
              // print(parent.title);
              // return TreeNodeData(
              //   title: parent.title == 'word'
              //       ? 'word'
              //       : parent.title == 'pdf'
              //       ? 'pdf'
              //       : 'link',
              //   expaned: true,
              //   checked: false,
              //   children: [],
              // );
            },
          ),
        ),
      ),
    );
  }
}
