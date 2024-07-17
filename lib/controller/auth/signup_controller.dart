import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petcare/core/class/apiresponse.dart';
import 'package:petcare/core/functions/saveandredirect.dart';
import 'package:petcare/data/datasource/remote/auth/signupdata.dart';
import 'package:petcare/data/models/user.dart';

abstract class SignupController extends GetxController {
  signUp();
}

class SignupControllerImp extends SignupController {
  bool loading = false;
  late TextEditingController signupemail;
  late TextEditingController signupfistname;
  late TextEditingController signuplastname;
  late TextEditingController signuppassword;

  GlobalKey<FormState> signupform = GlobalKey<FormState>();
  Signupdata signupdata = Signupdata();

  @override
  void onInit() {
    signupemail = TextEditingController();
    signupfistname = TextEditingController();
    signuplastname = TextEditingController();
    signuppassword = TextEditingController();
    super.onInit();
  }

  @override
  signUp() async {
    var signupformdata = signupform.currentState;

    if (signupformdata!.validate()) {
      loading = !loading;
      update();
      Apiresponse response = await signupdata.signupUser(signupfistname.text,
          signuplastname.text, signupemail.text, signuppassword.text);
      print(response.data);
      print(response.error);
      if (response.error == null) {
        saveAndRedirectToAddPet(response.data as User);
      } else {
        loading = !loading;
        update();
        Get.snackbar("Error", response.error!);
        response.error = null;
      }
    }
  }
}
