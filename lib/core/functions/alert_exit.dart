import 'dart:io';

import 'package:get/get.dart';


Future<bool> alertExitApp() {
  Get.defaultDialog(
    radius: 15.0,
    title: "Warning",
    middleText: "Do you want to exit",
    onConfirm: () {
      exit(0);
    },
    onCancel: () {
      Get.back();
    },
  );
  return Future.value(true);
}
