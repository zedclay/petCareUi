import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/core/constants/routes_names.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "settings",
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * .05, vertical: Get.height * .03),
          child: ListView(
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                    fontSize: 23,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImageAsset.acc),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Account",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              ListTile(
                onTap: () => Get.toNamed(AppRoutesNames.editprofile),
                title: const Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: SvgPicture.asset(AppImageAsset.edit),
              ),
              ListTile(
                onTap: () => Get.toNamed(AppRoutesNames.changepass),
                title: const Text(
                  "Change Password",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: SvgPicture.asset(AppImageAsset.pass),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImageAsset.notif),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Notifications",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              ListTile(
                  onTap: () {},
                  title: const Text(
                    "Notifications",
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppColor.backgroundColor,
                    activeTrackColor: AppColor.secondaryColor,
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImageAsset.other),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Other",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              ListTile(
                  onTap: () {},
                  title: const Text(
                    "Dark mode",
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppColor.backgroundColor,
                    activeTrackColor: AppColor.secondaryColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
