import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/seeall/seeallD_controller.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/data/models/pet.dart';

class SeeallD extends GetView<SeealldControllerImp> {
  const SeeallD({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SeealldControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Disappeared"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * .03,
        ),
        child: Obx(() {
          return GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 7,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                Pet pet = controller.disappearedPets[index];
                return InkWell(
                  onTap: () => Get.toNamed(AppRoutesNames.details,
                      arguments: {"id": pet.id, "section": "found"}),
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    color: const Color(0xA3F28F8F),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 130,
                          width: Get.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              pet.photo!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(pet.name!,
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
