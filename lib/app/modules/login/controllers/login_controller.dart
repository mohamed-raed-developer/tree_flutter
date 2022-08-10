import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_skeleton/app/data/models/login_model.dart';
import 'package:logger/logger.dart';

import '../../../../utils/constants.dart';
import '../../../routes/app_pages.dart';
import '../../../services/base_client.dart';

class LoginController extends GetxController {
  bool isLoadingLogin = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GetStorage authBox = GetStorage();

  bool validateForm() => formKey.currentState!.validate();

  bool isPassword = true;

  void passwordLock() {
    isPassword = !isPassword;
    update();
  }

  LoginModel? loginModel;

  login() async {
    // String? deviceId = await getId();
    if (!validateForm()) return;
    isLoadingLogin = true;
    update();
    await BaseClient.post(
      Constants.loginUrl,
      data: {
        'email': emailController.text.toString().trim(),
        'password': passwordController.text.toString().trim(),
      },
      onSuccess: (response) async {
        loginModel = LoginModel.fromJson(response.data);
        token = loginModel!.accessToken;
        update();
        authBox.write('token', token);
        update();
        Logger().e(token);
        Get.offNamed(Routes.MAIN);
      },
    );
    isLoadingLogin = false;
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
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
