import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/home/petdetails_controller.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/data/models/pet.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Details extends GetView<PetdetailsController> {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PetdetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Details"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "Warning",
                    middleText: "Do you want to delete this pet ?",
                    textConfirm: "Delete",
                    onConfirm: () {
                      Get.back();
                      Get.arguments['section'] == "found"
                          ? controller.deleteFoundPetById(Get.arguments["id"])
                          : controller
                              .deleteDisappearedPetById(Get.arguments["id"]);
                      Get.back();
                    },
                    textCancel: "Cancel");
              },
              icon: const Icon(Icons.delete_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        ],
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Positioned(
                bottom: 60,
                right: 20,
                child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: SvgPicture.asset(AppImageAsset.bgblur2))),
            Positioned(
                top: 20,
                child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: SvgPicture.asset(AppImageAsset.bgblur3))),
            Positioned(
                top: 60,
                right: 30,
                child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: SvgPicture.asset(AppImageAsset.bgblur4))),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () {
                      Pet pet = controller.pet.value;

                      return Container(
                        height: Get.height * .7,
                        width: Get.width * .8,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(colors: [
                              Color(0x66FFFFFF),
                              Color(0x66FFFFFF)
                            ])),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(35),
                                child: Image.network(
                                      pet.photo!,
                                      fit: BoxFit.fill,
                                    ) ??
                                    Image.asset(AppImageAsset.cat),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              Get.arguments["section"] == "found"
                                  ? "Found"
                                  : "Disappeared",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                pet.name ?? "unknown",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                pet.category ?? "unknown",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                pet.species ?? "unknown",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                pet.sex ?? "unknown",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                pet.birthDate ?? "unknown",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                pet.createdAt ?? "unknown",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 2,
                                    backgroundColor: AppColor.primaryColor,
                                    foregroundColor: Colors.white),
                                onPressed: () => Get.dialog(
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Center(
                                        child: PrettyQrView.data(
                                            data: pet.qrCodeText!),
                                      ),
                                    ),
                                    useSafeArea: true,
                                    barrierDismissible: true,
                                    barrierColor: const Color.fromARGB(
                                        131, 255, 255, 255)),
                                child: const Text("Generate QR Code"),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
