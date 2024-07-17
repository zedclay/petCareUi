import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomepageController extends GetxController {
  changepage(int index);
}

class HomepageControllerImp extends HomepageController
    with GetSingleTickerProviderStateMixin {
  int currentpage = 0;
  late AnimationController animcontrol;
  @override
  void onInit() {
    animcontrol =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.onInit();
  }

  @override
  changepage(index) {
    currentpage = index;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    animcontrol.dispose();
  }
}
