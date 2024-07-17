import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/views/screens/auth/auth.dart';
import 'package:petcare/views/widgets/auth/customtextfield.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class Newpass extends StatelessWidget {
  const Newpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(
                    onPressed: () => Get.back(),
                    style: ButtonStyle(
                      backgroundBuilder: (context, states, child) =>
                          const CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      "New password",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    "Enter new password",
                    style: TextStyle(fontSize: 16),
                  ),
                  const CustomTextfield(
                      hint: "Enter your new password",
                      suffixIcon: SizedBox.shrink()),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Confirm password",
                    style: TextStyle(fontSize: 16),
                  ),
                  const CustomTextfield(
                      hint: "Confirm your new password",
                      suffixIcon: SizedBox.shrink()),
                  const SizedBox(
                    height: 80,
                  ),

                  Center(
                    child: Custombtn1(
                        radius: 40,
                        padding: Get.width * .3,
                        text: "Send",
                        onpressed: () => Get.offAll(const Auth())),
                  ),
                  //
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
