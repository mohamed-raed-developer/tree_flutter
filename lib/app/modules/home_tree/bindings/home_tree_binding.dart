import 'package:get/get.dart';

import '../controllers/home_tree_controller.dart';

class HomeTreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeTreeController>(
      () => HomeTreeController(),
    );
  }
}
