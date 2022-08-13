import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

showDialogCustom({
  required String title,
  required String textNormal,
  required String textEmail,
  required Function okPress,
  required Function cancelPress,
}) {
  return Get.defaultDialog(
    title: title,
    radius: 20.r,
    confirm: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: Colors.greenAccent,
      onPressed: () {
        Get.back();
        okPress();
      },
      child: Text('OK'),
    ),
    cancel: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: Colors.greenAccent,
      onPressed: () => cancelPress(),
      child: Text('Cancel'),
    ),
    content: RichText(
      text: TextSpan(children: [
        TextSpan(
            text: textNormal,
            style: const TextStyle(
              color: Colors.black,
            )),
        TextSpan(
            text: textEmail,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            )),
      ]),
    ),
  );
}
