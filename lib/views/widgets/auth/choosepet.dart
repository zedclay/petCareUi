import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/add/addanimal_controller.dart';
import 'package:petcare/core/constants/color.dart';

class ChoosePet extends GetView<AddanimalController> {
  const ChoosePet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonHideUnderline(
        child: GetBuilder<AddanimalController>(
          builder: (controller) => Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.choosepetbgcolor),
            child: DropdownButton(
              icon: const Icon(Icons.unfold_more),
              borderRadius: BorderRadius.circular(8),
              iconEnabledColor: Colors.grey[600],
              padding: const EdgeInsets.symmetric(horizontal: 16),
              value: controller.cat,
              items: const [
                DropdownMenuItem(
                  value: "cat",
                  child: Text("Cat"),
                ),
                DropdownMenuItem(
                  value: "dog",
                  child: Text("Dog"),
                ),
              ],
              onChanged: (val) => controller.choosepet(val!),
              hint: const Text("Cat/Dog"),
              isExpanded: true,
            ),
          ),
        ),
      ),
    );
  }
}

class ChooseSex extends StatelessWidget {
  const ChooseSex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonHideUnderline(
        child: GetBuilder<AddanimalController>(
          builder: (controller) => Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.choosepetbgcolor),
            child: DropdownButton(
              icon: const Icon(Icons.unfold_more),
              borderRadius: BorderRadius.circular(8),
              iconEnabledColor: Colors.grey[600],
              padding: const EdgeInsets.symmetric(horizontal: 16),
              value: controller.sex,
              items: const [
                DropdownMenuItem(
                  value: "male",
                  child: Text("Male"),
                ),
                DropdownMenuItem(
                  value: "female",
                  child: Text("Female"),
                ),
              ],
              onChanged: (val) => controller.choosesex(val!),
              hint: const Text("Male/Female"),
              isExpanded: true,
            ),
          ),
        ),
      ),
    );
  }
}
