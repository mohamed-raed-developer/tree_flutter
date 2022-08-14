import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

showLoginDialog({
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


showAddNodeDialog({
  required Function okPress,
}) {

  TextEditingController controller = TextEditingController();

  return Get.defaultDialog(
    title: "Add folder",
    radius: 20.r,
    confirm: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: Colors.greenAccent,
      onPressed: () {
        if(controller.text.isNotEmpty){
          Get.back();
          okPress(controller.text);
        }
      },
      child: const Text('Add'),
    ),
    cancel: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: Colors.greenAccent,
      onPressed: () {
        Get.back();
      },
      child: const Text('Cancel'),
    ),
    content: TextFormField(
      controller: controller,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter your title';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Title',
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
  );
}


showEditNodeDialog({
  required Function okPress,
}) {

  TextEditingController controller = TextEditingController();

  return Get.defaultDialog(
    title: "Edit folder name",
    radius: 20.r,
    confirm: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: Colors.greenAccent,
      onPressed: () {
        if(controller.text.isNotEmpty){
          Get.back();
          okPress(controller.text);
        }
      },
      child: const Text('Edit'),
    ),
    cancel: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: Colors.greenAccent,
      onPressed: () {
        Get.back();
      },
      child: const Text('Cancel'),
    ),
    content: TextFormField(
      controller: controller,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter title';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Title',
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
  );
}

showDeleteNodeDialog({
  required Function okPress,
}) {


  return Get.defaultDialog(
    title: "Delete folder",
    radius: 20.r,
    confirm: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: Colors.greenAccent,
      onPressed: () {
          Get.back();
          okPress();
      },
      child: const Text('Delete'),
    ),
    cancel: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: Colors.greenAccent,
      onPressed: () {
        Get.back();
      },
      child: const Text('Cancel'),
    ),
    content: const Text(
      "Are you sure to delete this folder?"
    )
  );
}
