import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/home_tree_view.dart';
import 'package:getx_skeleton/app/modules/library/views/library_view.dart';
import 'package:getx_skeleton/app/modules/more/views/more_view.dart';

class MainController extends GetxController {
  int selectedIndex = 0;

  List<String> title = [
    'Home',
    'Library',
    'More',
  ];

  List<Widget> widgetOptions = <Widget>[
    HomeTreeView(),
    LibraryView(),
    MoreView(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
