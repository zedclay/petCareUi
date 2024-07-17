import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petcare/core/class/apiresponse.dart';
import 'package:petcare/core/functions/saveandredirect.dart';
import 'package:petcare/data/datasource/remote/auth/editprofiledata.dart';
import 'package:petcare/data/models/user.dart';

abstract class EditprofileController extends GetxController {
  editProfile();
}

class EditprofileControllerImp extends EditprofileController {
  bool loading = false;
  late TextEditingController email;
  late TextEditingController firstname;
  late TextEditingController lastname;

  GlobalKey<FormState> editprofileform = GlobalKey<FormState>();
  EditprofileData editprofileData = EditprofileData();

  @override
  void onInit() {
    email = TextEditingController();
    firstname = TextEditingController();
    lastname = TextEditingController();
    super.onInit();
  }

  @override
  editProfile() async {
    var editprofileformdata = editprofileform.currentState;

    if (editprofileformdata!.validate()) {
      loading = !loading;
      update();
      Apiresponse response = await editprofileData.editProfile(
          firstname.text, lastname.text, email.text);

      print(response.data);
      print(response.error);
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
