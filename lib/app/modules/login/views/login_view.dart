import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/home_tree/views/home_tree_view.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                controller: controller.emailController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.r)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10.r)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.r)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.r)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GetBuilder<LoginController>(
                builder: (_) => TextFormField(
                  controller: controller.passwordController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.isPassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    prefixIcon: InkWell(
                      onTap: () {
                        controller.passwordLock();
                      },
                      child: Icon(
                        controller.isPassword
                            ? Icons.lock_outline_rounded
                            : Icons.lock_open_rounded,
                        color: Colors.green,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10.r)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<LoginController>(builder: (_) {
                if (controller.isLoadingLogin) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return MaterialButton(
                    onPressed: () {
                      controller.login();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    color: Colors.greenAccent,
                    minWidth: MediaQuery.of(context).size.width / 2,
                    height: 45.h,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                      ),
                    ),
                  );
                }
              }),
              SizedBox(
                height: 5.h,
              ),
              controller.supportState == SupportState.supported
                  ? GetBuilder<LoginController>(
                      builder: (_) => MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        color: Colors.greenAccent,
                        minWidth: MediaQuery.of(context).size.width / 2,
                        height: 45.h,
                        onPressed: controller.authenticateWithBiometrics,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Icon(Icons.fingerprint),
                            Text(
                              controller.isAuthenticating
                                  ? 'Cancel'
                                  : 'Login With biometrics',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              controller.supportState == SupportState.supported
                  ? Text('Current State: ${controller.authorized}\n')
                  : Container(),
            ],
          ),
        ),
      )),
    );
  }
}
