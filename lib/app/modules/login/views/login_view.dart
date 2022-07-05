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
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                prefixIcon: const Icon(Icons.email,color: Colors.green,),
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your Password',
                prefixIcon: const Icon(Icons.lock,color: Colors.green,),
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
              height: 20.h,
            ),
            MaterialButton(
              onPressed: () {
                Get.offNamed(Routes.MAIN);
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
            ),
          ],
        ),
      )),
    );
  }
}
