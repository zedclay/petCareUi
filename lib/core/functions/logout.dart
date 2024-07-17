import 'package:get/get.dart';
import 'package:petcare/core/services/services.dart';

Future<bool> logout() async {
  MyServices myServices = Get.find();

  return await myServices.sharedprefs.remove('token');
}