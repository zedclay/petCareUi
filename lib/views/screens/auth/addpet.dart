import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/views/widgets/auth/choosepet.dart';
import 'package:petcare/views/widgets/auth/customtextfield.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class Addpet extends StatelessWidget {
  const Addpet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .1),
          height: Get.height,
          width: Get.width,
          child: ListView(
            children: [
              Text(
                textAlign: TextAlign.center,
                "Let’s start by creating portfolio for your pet! ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
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
              Center(
                child: Text(
                  "Upload image",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Categories",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const ChoosePet(),
              Text(
                "Name",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const CustomTextfield(
                hint: "",
                suffixIcon: SizedBox.shrink(),
                radius: 8,
                fill: AppColor.choosepetbgcolor,
              ),
              Text(
                "Species",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const CustomTextfield(
                hint: "",
                suffixIcon: SizedBox.shrink(),
                radius: 8,
                fill: AppColor.choosepetbgcolor,
              ),
              Text(
                "Sex",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const ChooseSex(),
              Text(
                "Birthday",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const CustomTextfield(
                hint: "Day/Month/Year",
                suffixIcon: SizedBox.shrink(),
                fill: AppColor.choosepetbgcolor,
                radius: 8,
              ),
              const SizedBox(
                height: 20,
              ),
              Custombtn1(
                  padding: 0,
                  text: "SAVE",
                  onpressed: () => Get.offNamed(AppRoutesNames.enablelocation)),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width * .18),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: Colors.grey[700],
                      ),
                      Text("Add another pet",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
