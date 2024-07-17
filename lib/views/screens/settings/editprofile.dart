import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/auth/editprofile.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/functions/validinput.dart';
import 'package:petcare/views/widgets/auth/customtextfield.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class Editprofile extends GetView<EditprofileControllerImp> {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EditprofileControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit profile",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
          child: Form(
            key: controller.editprofileform,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage: null,
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "First name",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                CustomTextfield(
                  textcontroller: controller.firstname,
                  hint: "Enter your firstname",
                  suffixIcon: const SizedBox.shrink(),
                  radius: 8,
                  fill: Colors.white,
                ),
                Text(
                  "Last name",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                CustomTextfield(
                  textcontroller: controller.lastname,
                  hint: "Enter your lastname",
                  suffixIcon: const SizedBox.shrink(),
                  radius: 8,
                  fill: Colors.white,
                ),
                Text(
                  "Email",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                CustomTextfield(
                  textcontroller: controller.email,
                  hint: "Enter your email address",
                  isvalid: (val) => validInput(val!, 8, 40, "email"),
                  suffixIcon: const SizedBox.shrink(),
                  radius: 8,
                  fill: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GetBuilder<EditprofileControllerImp>(
                    builder: (controller) => controller.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColor.primaryColor,
                            ),
                          )
                        : Custombtn1(
                            padding: Get.width * .1,
                            text: "Save changes",
                            onpressed: () => controller.editProfile()),
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
