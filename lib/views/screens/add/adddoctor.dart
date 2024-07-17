import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/home/clinic/doctor_controller.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/data/models/doctor.dart';
import 'package:petcare/views/widgets/auth/customtextfield.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class Adddoctor extends GetView<DoctorController> {
  const Adddoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "doc",
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Joining the list"),
              centerTitle: true,
            ),
            body: Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width * .1),
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.doctorForm,
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
                            height: 50,
                          ),
                          Text(
                            "Name",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          CustomTextfield(
                            textcontroller: controller.name,
                            hint: "Enter your name",
                            suffixIcon: const SizedBox.shrink(),
                            radius: 8,
                            fill: AppColor.choosepetbgcolor,
                          ),
                          Text(
                            "Clinic name",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          CustomTextfield(
                            textcontroller: controller.clinicname,
                            hint: "Enter your clinic name",
                            suffixIcon: const SizedBox.shrink(),
                            radius: 8,
                            fill: AppColor.choosepetbgcolor,
                          ),
                          Text(
                            "Address",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          CustomTextfield(
                            textcontroller: controller.address,
                            hint: "Enter your address",
                            suffixIcon: const SizedBox.shrink(),
                            radius: 8,
                            fill: AppColor.choosepetbgcolor,
                          ),
                          Text(
                            "Phone",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          CustomTextfield(
                            textcontroller: controller.phone,
                            hint: "Enter your phone number",
                            suffixIcon: const SizedBox.shrink(),
                            radius: 8,
                            fill: AppColor.choosepetbgcolor,
                          ),
                          Center(
                            child: GetBuilder<DoctorController>(
                              builder: (controller) =>
                                  controller.isLoading.value
                                      ? const CircularProgressIndicator()
                                      : Custombtn1(
                                          padding: Get.width * .1,
                                          text: "PUBLISH",
                                          onpressed: () =>
                                              controller.createPetDoctor()),
                            ),
                          )
                        ]),
                  ),
                ))));
  }
}
