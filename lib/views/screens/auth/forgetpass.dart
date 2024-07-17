import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/views/widgets/auth/customtextfield.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});

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
                      "Forget password",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  const Center(
                    child: Text(
                      "Enter email address",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const CustomTextfield(
                      hint: "Enter your email address",
                      suffixIcon: SizedBox.shrink()),
                  const SizedBox(
                    height: 80,
                  ),

                  Center(
                    child: Custombtn1(
                        radius: 40,
                        padding: Get.width * .3,
                        text: "Send",
                        onpressed: () => Get.toNamed(AppRoutesNames.verifyOtp)),
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
