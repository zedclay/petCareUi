import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/home/homefeed_controller.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/core/constants/routes_names.dart';

class Profile extends GetView<HomefeedControllerImp> {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [Icon(Icons.notifications)],
        leading: Hero(
          tag: "settings",
          child: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(AppRoutesNames.settings),
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * .2, vertical: Get.height * .01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff4D8EAF)),
          child: const Text("PROFILE"),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            margin:
                EdgeInsets.symmetric(horizontal: Get.width * .01, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: const CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColor.secondaryColor,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Card(
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * .06,
                        vertical: Get.height * .03),
                    height: Get.height * .2,
                    width: Get.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(26)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Icon(Icons.mail_outline),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "email@gmail.com",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * .02,
                        vertical: Get.height * .02),
                    height: Get.height * .25,
                    width: Get.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(26)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppImageAsset.paw),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "My Pets",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 26),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...List.generate(
                                    2,
                                    (i) => const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: CircleAvatar(
                                            radius: 40,
                                            backgroundImage:
                                                AssetImage(AppImageAsset.cat),
                                          ),
                                        )),
                                IconButton(
                                  onPressed: () {},
                                  icon: const CircleAvatar(
                                    backgroundColor: AppColor.secondaryColor,
                                    radius: 40,
                                    child: Icon(
                                      Icons.add,
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => controller.signOut(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.exit_to_app_sharp,
                          color: AppColor.primaryColor, size: 30),
                      Text(
                        "Sign Out",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
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
