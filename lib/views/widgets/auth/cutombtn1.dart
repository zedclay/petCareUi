import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';

class Custombtn1 extends StatelessWidget {
  final double padding;
  final String text;
  final double radius;
  final void Function()? onpressed;
  const Custombtn1({
    super.key,
    required this.padding,
    required this.text,
    required this.onpressed,
    this.radius = 10
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
            padding: EdgeInsets.symmetric(
                horizontal: padding, vertical: Get.height * .02)),
        onPressed: onpressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.white),
        ));
  }
}
