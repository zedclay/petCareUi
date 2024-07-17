import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class EnableLocation extends StatelessWidget {
  const EnableLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColor.secondaryColor,
                radius: 100,
                child: Image.asset(AppImageAsset.location),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Enable Location",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Your location will be used to show nearby veterinarians\n and pet stores",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color.fromARGB(181, 114, 114, 114),
                    fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Custombtn1(
                  padding: Get.width * .3,
                  text: "ALLOW LOCATION",
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
                    onpressed: () => Get.offNamed(AppRoutesNames.enablenotify)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
