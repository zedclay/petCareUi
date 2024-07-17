import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petcare/core/class/apiresponse.dart';
import 'package:petcare/core/functions/saveandredirect.dart';
import 'package:petcare/data/datasource/remote/auth/logindata.dart';
import 'package:petcare/data/models/user.dart';

abstract class LoginController extends GetxController {
  signIn();
  hidepass();
}

class LoginControllerImp extends LoginController {
  bool loading = false;
  bool ischecked = false;
  late TextEditingController signinemail;

  late TextEditingController signinpass;

  GlobalKey<FormState> signinform = GlobalKey<FormState>();
  Logindata logindata = Logindata();

  @override
  void onInit() {
    signinemail = TextEditingController();

    signinpass = TextEditingController();
    super.onInit();
  }

  @override
  signIn() async {
    var signinformdata = signinform.currentState;

    if (signinformdata!.validate()) {
      loading = !loading;
      update();
      Apiresponse response =
          await logindata.loginUser(signinemail.text, signinpass.text);
      print(response.data);
      print(response.error);
      if (response.error == null) {
        saveAndRedirectToHome(response.data as User);
      } else {
        loading = !loading;
        update();
        Get.snackbar("Error", response.error!);
      }
    }
  }

  @override
  void dispose() {
    signinemail.dispose();
    signinpass.dispose();
    loading = false;

    super.dispose();
  }

  @override
  hidepass() {
    ischecked = !ischecked;
    update();
  }
}
