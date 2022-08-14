import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_skeleton/app/data/models/login_model.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_dialog.dart';
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
  String? emailStorage;
  String? passwordStorage;
  String? tokenLogin;

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

  Future<void> login({required String email, required String password}) async {
    // String? deviceId = await getId();
    isLoadingLogin = true;
    update();
    await BaseClient.post(
      Constants.loginUrl,
      data: {
        'email': email,
        'password': password,
      },
      onSuccess: (response) async {
        loginModel = LoginModel.fromJson(response.data);
        token = loginModel!.accessToken;
        update();
        emailStorage != null
            ? null
            : authBox.write('email', emailController.text.toString().trim());
        passwordStorage != null
            ? null
            : authBox.write(
                'password', passwordController.text.toString().trim());
        Logger().e(loginModel!.accessToken);
        passwordStorage == null ? null : Get.back();
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
    emailStorage = GetStorage().read<String>('email');
    passwordStorage = GetStorage().read<String>('password');
    super.onInit();
    auth.isDeviceSupported().then(
          (bool isSupported) => supportState =
              isSupported ? SupportState.supported : SupportState.unsupported,
        );
    update();

    emailStorage != null
        ? WidgetsBinding.instance.addPostFrameCallback((_) => showLoginDialog(
            title: 'Login',
            textNormal: 'Do you want to login with this email: ',
            textEmail: '$emailStorage ?',
            okPress: () async {
              supportState == SupportState.supported
                  ? await authenticateWithBiometrics().then((value) async {
                      authorized != 'Authorized'
                          ? Get.snackbar('Biometric', 'Not Authorized')
                          : await login(
                              email: emailStorage!,
                              password: passwordStorage!,
                            );
                    })
                  : Get.offNamed(Routes.MAIN);
            },
            cancelPress: () {
              Get.back();
            }))
        : null;
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
