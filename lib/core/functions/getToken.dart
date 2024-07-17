import 'package:get/get.dart';
import 'package:petcare/core/services/services.dart';

Future<String> getToken() async {
  MyServices myServices = Get.find();
  return myServices.sharedprefs.getString('token') ?? '';
}
