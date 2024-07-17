import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verifyotp extends StatelessWidget {
  const Verifyotp({super.key});

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
                      "Verification",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  const Center(
                    child: Text(
                      "Enter Verification code",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  PinCodeTextField(
                    animationType: AnimationType.slide,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    showCursor: true,
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 4,
                    autoFocus: true,
                    onCompleted: (val) =>
                        Get.offNamed(AppRoutesNames.successReset),
                    pinTheme: PinTheme(
                      selectedColor: Colors.green,
                      inactiveFillColor: AppColor.highlightColor,
                      shape: PinCodeFieldShape.circle,
                      activeColor: AppColor.backgroundColor,
                      activeFillColor: AppColor.highlightColor,
                      inactiveColor: AppColor.highlightColor,
                      selectedFillColor: AppColor.highlightColor,
                    ),
                  )

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
