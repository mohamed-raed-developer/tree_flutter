import 'package:flutter/material.dart';
// import 'package:flutter_tree/flutter_tree.dart';

import 'package:get/get.dart';
// import 'package:getx_skeleton/app/modules/home_tree/views/widget/bottom_sheet_widget.dart';

import '../controllers/home_tree_controller.dart';

class HomeTreeView extends GetView<HomeTreeController> {
  const HomeTreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeTreeController());
    return SafeArea(
      child: Container(),
      // GetBuilder<HomeTreeController>(
      //   builder: (_) => TreeView(
      //     data: controller.treeData,
      //     showActions: true,
      //     append: (parent) async {
      //       if (parent.title == 'word & pdf') {
      //         return bottomSheet(
      //             context: context,
      //             isLink: false,
      //             nameChoose: controller.nameFile ?? 'No file selected',
      //             choose: 'Choose a file',
      //             node: TreeNodeData(
      //               children: [],
      //               title: controller.nameFile ?? '123',
      //               expaned: false,
      //               checked: false,
      //             ),
      //             onPressButton: () async {
      //               await controller.chooseFile();
      //             });
      //       } else if (parent.title == 'link') {
      //         return bottomSheet(
      //           context: context,
      //           nameChoose: controller.linkController.text,
      //           isLink: true,
      //           choose: 'Add a link youtube',
      //           node: TreeNodeData(
      //             children: [],
      //             title: controller.linkController.text,
      //             expaned: false,
      //             checked: false,
      //           ),
      //           controller: controller.linkController,
      //           onPressButton: () {
      //             //save link
      //           },
      //         );
      //       } else if (parent.title == 'Video') {
      //         return bottomSheet(
      //           context: context,
      //           nameChoose: controller.nameVideo ?? 'No Video selected',
      //           isLink: false,
      //           choose: 'Add a Video',
      //           node: TreeNodeData(
      //             children: [],
      //             title: controller.nameVideo!,
      //             expaned: false,
      //             checked: false,
      //           ),
      //           onPressButton: () {
      //             controller.chooseVideo();
      //           },
      //         );
      //       } else if (parent.title == 'Image') {
      //         return bottomSheet(
      //           context: context,
      //           nameChoose: controller.nameImage ?? 'No Image selected',
      //           isLink: false,
      //           choose: 'Add a Image',
      //           node: TreeNodeData(
      //             children: [],
      //             title: controller.nameImage!,
      //             expaned: false,
      //             checked: false,
      //           ),
      //           onPressButton: () {
      //             controller.chooseImage();
      //           },
      //         );
      //       } else {
      //         return TreeNodeData(
      //           children: [],
      //           title: '',
      //           expaned: false,
      //           checked: false,
      //         );
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
