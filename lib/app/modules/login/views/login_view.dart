import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_dialog.dart';

import '../../../routes/app_pages.dart';
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
                Image.asset('assets/images/login.png'),
                SizedBox(height: 20,),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1aa078),
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
                      color: Color(0xFF1aa078),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF1aa078)),
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
                          color: Color(0xFF1aa078),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.r)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF1aa078)),
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
                      onPressed: () async{
                        if (!controller.validateForm()) return;
                        await controller.login(
                          email:
                              controller.emailController.text.toString().trim(),
                          password: controller.passwordController.text.toString().trim()
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      color: const Color(0xFF1aa078),
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
                ElevatedButton(
                  onPressed: (){
                    showLoginDialog(
                        title: 'Login',
                        textNormal: 'Do you want to login with this email: ',
                        textEmail: '${controller.emailStorage} ?',
                        okPress: () async {
                          controller.supportState == SupportState.supported
                              ? await controller.authenticateWithBiometrics().then((value) async {
                            controller.authorized != 'Authorized'
                                ? Get.snackbar('Biometric', 'Not Authorized')
                                : await controller.login(
                              email:controller. emailStorage!,
                              password: controller.passwordStorage!,
                            );
                          })
                              : Get.offNamed(Routes.MAIN);
                        },
                        cancelPress: () {
                          Get.back();
                        });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(controller.isAuthenticating
                          ? 'Cancel'
                          : 'Login With Biometrics'),
                      const Icon(Icons.fingerprint),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
