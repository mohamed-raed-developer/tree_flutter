import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/home_tree_view.dart';
import 'package:getx_skeleton/app/modules/library/views/library_view.dart';
import 'package:getx_skeleton/app/modules/more/views/more_view.dart';
import 'package:logger/logger.dart';

import '../../../../utils/constants.dart';
import '../../../data/models/login_model.dart';
import '../../../services/base_client.dart';

class MainController extends GetxController {
  int selectedIndex = 0;

  final GetStorage authBox = GetStorage();
  var token = GetStorage().read<String>('token');

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

  LoginModel? refreshModel;

  refreshToken() async {
    await BaseClient.post(
      Constants.refreshUrl,
      headers: {
        'Authorization':'Bearer '+ token!,
      },
      onSuccess: (response) {
        refreshModel = LoginModel.fromJson(response.data);
        authBox.remove('token');
        authBox.write('token', refreshModel!.accessToken);
        Logger().e(GetStorage().read<String>('token'));
      },
    );
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    refreshToken();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
