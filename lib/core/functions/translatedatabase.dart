
import 'package:get/get.dart';
import 'package:petcare/core/services/services.dart';

translateDatabase(columnAr, columnFr) {
  MyServices myservices = Get.find();

  if (myservices.sharedprefs.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnFr;
  }
}
