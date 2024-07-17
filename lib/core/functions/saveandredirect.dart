import 'package:get/get.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/core/services/services.dart';
import 'package:petcare/data/models/user.dart';

void saveAndRedirectToHome(User user) async {
  MyServices myServices = Get.find();
  await myServices.sharedprefs.setString('token', user.token ?? '');
  await myServices.sharedprefs.setInt('userId', user.id ?? 0);
  Get.offAllNamed(AppRoutesNames.homepage);
}


void saveAndRedirectToAddPet(User user) async {
  MyServices myServices = Get.find();
  await myServices.sharedprefs.setString('token', user.token ?? '');
  await myServices.sharedprefs.setInt('userId', user.id ?? 0);
  Get.offAllNamed(AppRoutesNames.addpet);
}

void saveAndRedirectBack(User user) async {
  MyServices myServices = Get.find();
  await myServices.sharedprefs.setString('token', user.token ?? '');
  await myServices.sharedprefs.setInt('userId', user.id ?? 0);
  Get.back();
}