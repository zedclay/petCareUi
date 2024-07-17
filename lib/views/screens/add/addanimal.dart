import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/add/addanimal_controller.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/functions/validinput.dart';
import 'package:petcare/views/widgets/auth/choosepet.dart';
import 'package:petcare/views/widgets/auth/customtextfield.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class Addanimal extends GetView<AddanimalController> {
  const Addanimal({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddanimalController());
    return Hero(
      tag: "add",
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Add an animal"),
              centerTitle: true,
              bottom: TabBar(
                indicatorColor: Colors.grey,
                labelColor: AppColor.primaryColor,
                unselectedLabelColor: AppColor.secondaryColor,
                tabs: [
                  Tab(
                    child: Text(
                      "Dissapeared",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      child: Text(
                        "Find",
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: const SafeArea(
                child: TabBarView(
                    children: [DissapearedTabView(), FindTabView()]))),
      ),
    );
  }
}

class FindTabView extends GetView<AddanimalController> {
  const FindTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * .1),
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Obx(() {
                  if (controller.selectedImage.value != null) {
                    return IconButton(
                      onPressed: () => controller.pickImage(),
                      icon: CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColor.secondaryColor,
                          child: Image.file(
                            controller.selectedImage.value!,
                            fit: BoxFit.contain,
                          )),
                    );
                  } else {
                    return IconButton(
                      onPressed: () => controller.pickImage(),
                      icon: const CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColor.secondaryColor,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 50,
                        ),
                      ),
                    );
                  }
                }),
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
                "Categories",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const ChoosePet(),
              Text(
                "Species",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextfield(
                textcontroller: controller.foundspecies,
                hint: "Enter your pet species",
                suffixIcon: const SizedBox.shrink(),
                radius: 8,
                fill: AppColor.choosepetbgcolor,
              ),
              Text(
                "Sex",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const ChooseSex(),
              Text(
                "Address",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextfield(
                textcontroller: controller.foundaddress,
                hint: "Your address",
                suffixIcon: const SizedBox.shrink(),
                radius: 8,
                fill: AppColor.choosepetbgcolor,
              ),
              Text(
                "Phone number",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextfield(
                textcontroller: controller.foundphone,
                hint: "Your phone number",
                isvalid: (val) => validInput(val!, 4, 12, "phone"),
                suffixIcon: const SizedBox.shrink(),
                radius: 8,
                fill: AppColor.choosepetbgcolor,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GetBuilder<AddanimalController>(
                  builder: (controller) => controller.isloading
                      ? const CircularProgressIndicator()
                      : Custombtn1(
                          padding: Get.width * .1,
                          text: "PUBLISH",
                          onpressed: () => controller.createFoundPet()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DissapearedTabView extends GetView<AddanimalController> {
  const DissapearedTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * .1),
      height: Get.height,
      width: Get.width,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Obx(() {
                  if (controller.selectedImage.value != null) {
                    return IconButton(
                      onPressed: () => controller.pickImage(),
                      icon: CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColor.secondaryColor,
                          child: Image.file(
                            controller.selectedImage.value!,
                            fit: BoxFit.contain,
                          )),
                    );
                  } else {
                    return IconButton(
                      onPressed: () => controller.pickImage(),
                      icon: const CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColor.secondaryColor,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 50,
                        ),
                      ),
                    );
                  }
                }),
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
                hint: "Enter pet name",
                suffixIcon: const SizedBox.shrink(),
                radius: 8,
                fill: AppColor.choosepetbgcolor,
              ),
              Text(
                "Categories",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const ChoosePet(),
              Text(
                "Species",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextfield(
                textcontroller: controller.species,
                hint: "Enter your pet species",
                suffixIcon: const SizedBox.shrink(),
                radius: 8,
                fill: AppColor.choosepetbgcolor,
              ),
              Text(
                "Sex",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const ChooseSex(),
              Text(
                "Address",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextfield(
                textcontroller: controller.address,
                hint: "Your address",
                suffixIcon: const SizedBox.shrink(),
                radius: 8,
                fill: AppColor.choosepetbgcolor,
              ),
              Text(
                "Phone number",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextfield(
                textcontroller: controller.phone,
                hint: "Your phone number",
                suffixIcon: const SizedBox.shrink(),
                radius: 8,
                fill: AppColor.choosepetbgcolor,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GetBuilder<AddanimalController>(
                  builder: (controller) => controller.isloading
                      ? const CircularProgressIndicator()
                      : Custombtn1(
                          padding: Get.width * .1,
                          text: "PUBLISH",
                          onpressed: () => controller.createDissapearedPet()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
