import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/auth/login_controller.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/core/functions/validinput.dart';
import 'package:petcare/views/widgets/auth/customtextfield.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class Login extends GetView<LoginControllerImp> {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .08),
      height: Get.height * .7,
      decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Form(
          key: controller.signinform,
          child: Column(
            children: [
              Image.asset(
                AppImageAsset.signinlogo,
              ),
              Text(
                "Welcome Back",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                  textcontroller: controller.signinemail,
                  hint: "Email address",
                  isvalid: (val) => validInput(val!, 5, 40, "email"),
                  suffixIcon: const SizedBox.shrink()),
              CustomTextfield(
                  textcontroller: controller.signinpass,
                  hint: "Password",
                  isvalid: (val) => validInput(val!, 8, 25, "password"),
                  ishidden: controller.ischecked,
                  suffixIcon: GetBuilder<LoginControllerImp>(
                    builder: (controller) => IconButton(
                        onPressed: () => controller.hidepass(),
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          size: 30,
                        )),
                  )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () => Get.toNamed(AppRoutesNames.forgetPass),
                      child: Text(
                        "Forget passowrd ?",
                        textAlign: TextAlign.right,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: const Color(0x78000000)),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * .02),
                  child: GetBuilder<LoginControllerImp>(
                    builder: (controller) => controller.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColor.primaryColor,
                            ),
                          )
                        : Custombtn1(
                            padding: Get.width * .3,
                            onpressed: () => controller.signIn(),
                            text: "Sign In",
                          ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
