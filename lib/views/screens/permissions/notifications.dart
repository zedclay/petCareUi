import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class EnableNotify extends StatelessWidget {
  const EnableNotify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: AppColor.secondaryColor,
                radius: 100,
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 180,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Enable Notificaitons",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Enable notifications for reminders and messages",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color.fromARGB(181, 114, 114, 114),
                    fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Custombtn1(
                  padding: Get.width * .24,
                  text: "ALLOW NOTIFICATIONS",
                  onpressed: () {}),
              const SizedBox(
                height: 20,
              ),
              Opacity(
                  opacity: .4,
                  child: Custombtn1(
                      padding: Get.width * .3,
                      text: "SKIP FOR NOW",
                      radius: 30,
                      onpressed: () =>Get.offAllNamed(AppRoutesNames.homepage))),
            ],
          ),
        ),
      ),
    );
  }
}
