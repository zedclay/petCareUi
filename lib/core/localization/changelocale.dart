import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/core/services/services.dart';

class LocaleController extends GetxController {
  late Locale langage;

  MyServices myservices = Get.find();

  changelang(String langcode) {
    Locale mylocale = Locale(langcode);
    myservices.sharedprefs.setString("lang", langcode);
    Get.updateLocale(mylocale);
  }

  @override
  void onInit() {
    String? currentlocale = myservices.sharedprefs.getString("lang");
    if (currentlocale == "ar") {
      langage = const Locale("ar");
    } else if (currentlocale == "fr") {
      langage = const Locale("fr");
    } else {
      langage = const Locale("en");
    }
    super.onInit();
  }
}
