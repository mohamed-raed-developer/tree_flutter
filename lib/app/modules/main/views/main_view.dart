import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    return GetBuilder<MainController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(controller.title[controller.selectedIndex]),
          centerTitle: true,
        ),
        body: controller.widgetOptions[controller.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_add_check),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more),
              label: 'More',
            ),
          ],
          currentIndex: controller.selectedIndex,
          selectedItemColor: const Color(0xFF1aa078),
          onTap:(i)=> controller.onItemTapped(i),
        ),
      ),
    );
  }
}
