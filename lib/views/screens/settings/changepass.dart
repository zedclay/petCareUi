import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/auth/changepass.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/core/functions/validinput.dart';
import 'package:petcare/views/widgets/auth/customtextfield.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class Changepass extends GetView<ChangepassControllerImp> {
  const Changepass({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ChangepassControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change password",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
          child: Form(
            key: controller.changepassform,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AppImageAsset.changepass)),
                Center(
                  child: Text(
                    "Change Password",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Current password",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                CustomTextfield(
                  textcontroller: controller.oldpass,
                  hint: "Enter your current password",
                  isvalid: (val) =>validInput(val!, 8, 25, "password"),
                  suffixIcon: const SizedBox.shrink(),
                  radius: 8,
                  fill: Colors.white,
                ),
                Text(
                  "New password",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                CustomTextfield(
                  textcontroller: controller.newpass,
                  hint: "Enter your new password",
                  isvalid: (val) =>validInput(val!, 8, 25, "password"),
                  suffixIcon: const SizedBox.shrink(),
                  radius: 8,
                  fill: Colors.white,
                ),
                Text(
                  "Confirm password",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                CustomTextfield(
                  textcontroller: controller.confirmpass,
                  hint: "Confirm your new password",
                  isvalid: (val) =>validInput(val!, 8, 25, "password"),
                  suffixIcon: const SizedBox.shrink(),
                  radius: 8,
                  fill: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GetBuilder<ChangepassControllerImp>(
                    builder: (controller) => controller.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColor.primaryColor,
                            ),
                          )
                        : Custombtn1(
                            padding: Get.width * .1,
                            text: "Change password",
                            onpressed: () => controller.changePass()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
