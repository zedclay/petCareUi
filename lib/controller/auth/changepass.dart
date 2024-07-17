import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petcare/core/class/apiresponse.dart';
import 'package:petcare/core/functions/saveandredirect.dart';
import 'package:petcare/data/datasource/remote/auth/changepassdata.dart';
import 'package:petcare/data/models/user.dart';

abstract class ChangepassController extends GetxController {
  changePass();
}

class ChangepassControllerImp extends ChangepassController {
  bool loading = false;
  late TextEditingController oldpass;
  late TextEditingController newpass;
  late TextEditingController confirmpass;

  GlobalKey<FormState> changepassform = GlobalKey<FormState>();
  Changepassdata changepassdata = Changepassdata();

  @override
  void onInit() {
    oldpass = TextEditingController();
    newpass = TextEditingController();
    confirmpass = TextEditingController();
    super.onInit();
  }

  @override
  changePass() async {
    var changepassformdata = changepassform.currentState;

    if (changepassformdata!.validate()) {
      loading = !loading;
      update();
      Apiresponse response = await changepassdata.changePass(
          oldpass.text, newpass.text, confirmpass.text);

      if (response.error == null) {
        saveAndRedirectBack(response.data as User);
      } else {
        loading = !loading;
        update();
        Get.snackbar("Error", response.error!);
        response.error = null;
      }
    }
  }
}
