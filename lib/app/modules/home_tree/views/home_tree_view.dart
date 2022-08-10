import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_view/tree_view.dart';

import '../controllers/home_tree_controller.dart';

class HomeTreeView extends GetView<HomeTreeController> {
  const HomeTreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeTreeController());
    return SafeArea(
      child: GetBuilder<HomeTreeController>(
        builder: (_) => TreeView(
          startExpanded: false,
          children: controller.getChildList(controller.documentList),
        ),
      ),
    );
  }
}
