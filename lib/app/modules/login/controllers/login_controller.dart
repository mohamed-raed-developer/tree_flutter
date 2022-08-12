import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_skeleton/app/data/models/login_model.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';

import '../../../../utils/constants.dart';
import '../../../routes/app_pages.dart';
import '../../../services/base_client.dart';
enum SupportState {
  unknown,
  supported,
  unsupported,
}

class LoginController extends GetxController {
  bool isLoadingLogin = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GetStorage authBox = GetStorage();

  final LocalAuthentication auth = LocalAuthentication();

  SupportState supportState = SupportState.unknown;
  String authorized = 'Not Authorized';
  bool isAuthenticating = false;

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
        // authBox.write('token', token);
        // update();
        Logger().e(token);
        Get.offNamed(Routes.MAIN);
      },
    );
    isLoadingLogin = false;
    update();
  }

  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = 'Authenticating';
      update();
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      isAuthenticating = false;
      authorized = 'Authenticating';
      update();
    } on PlatformException catch (e) {
      print(e);

      isAuthenticating = false;
      authorized = 'Error - ${e.message}';
      update();
      return;
    }
    final String message = authenticated ? 'Authorized' : 'Not Authorized';

    authorized = message;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    auth.isDeviceSupported().then(
          (bool isSupported) => supportState = isSupported
              ? SupportState.supported
              : SupportState.unsupported,
        );
    update();
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
