
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyServices extends GetxService {
  String? token;
  late SharedPreferences sharedprefs;

  Future<MyServices> init() async {
    sharedprefs = await SharedPreferences.getInstance();
    return this;
  }
}

initialservices() async {
  await Get.putAsync(() => MyServices().init());
}
