import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_skeleton/app/modules/home_tree/controllers/home_tree_controller.dart';

void bottomSheet({
  required BuildContext context,
  required String choose,
  required String nameChoose,
  required Function onPressButton,
  TextEditingController? controller,
  required bool isLink,
}) {
  final formKey = GlobalKey<FormState>();
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(27.r),
        topLeft: Radius.circular(27.r),
      ),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                choose,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              MaterialButton(
                onPressed: () {
                  onPressButton();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                color: Colors.blue,
                minWidth: MediaQuery.of(context).size.width / 2,
                height: 45.h,
                child: Text(
                  'Choose',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              isLink
                  ? TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Enter Link',
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10.r)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.r)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 10.h,
              ),
              Text(
                nameChoose,
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
