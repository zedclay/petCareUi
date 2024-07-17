import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/auth/login_controller.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';
import 'package:petcare/views/widgets/auth/login.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: SvgPicture.asset(AppImageAsset.bgblur)),
            ],
          ),
          Container(
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * .05, vertical: Get.height * .08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Lost-Pet-Finder",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Image.asset(AppImageAsset.logoimage),
                Custombtn1(
                  padding: Get.width * .15,
                  onpressed: () => Get.toNamed(AppRoutesNames.signup),
                  text: "CREATE ACCOUNT",
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColor.primaryColor,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: AppColor.primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * .25,
                            vertical: Get.height * .02)),
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => const Login());
                    },
                    child: Text(
                      "LOG IN",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: AppColor.highlightColor),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
