import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:petcare/controller/home/homefeed_controller.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/data/datasource/static/static.dart';
import 'package:petcare/data/models/pet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomefeedControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [Icon(Icons.notifications)],
        leading: Hero(
          tag: "settings",
          child: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(AppRoutesNames.settings),
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * .2, vertical: Get.height * .01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff4D8EAF)),
          child: const Text("HOME"),
        ),
      ),
      body: LiquidPullToRefresh(
        animSpeedFactor: 4.0,
        height: 80,
        onRefresh: () => controller.handleRefresh(),
        child: SafeArea(
          child: Form(
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<HomefeedControllerImp>(
                  builder: (controller) => SizedBox(
                    height: Get.height * .055,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (builder, index) => Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () => controller.changeCat(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: controller.currentindex == index
                                    ? AppColor.backgroundColor
                                    : Colors.white),
                            width: 100,
                            height: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const CircleAvatar(
                                    radius: 15,
                                    backgroundImage:
                                        AssetImage(AppImageAsset.cat)),
                                Text(
                                  catnames[index],
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Searchfield(),
                const SizedBox(
                  height: 20,
                ),
                DissapearedPetTitle(
                  title: "Pet Disappeared",
                  ontap: () => Get.toNamed(AppRoutesNames.seeallD),
                ),
                Container(
                  height: Get.height * .3,
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * .03, vertical: 10),
                  child: Obx(() {
                    if (controller.disappearedPets.isEmpty) {
                      return const Center(
                        child: Text("No Dissapeared pets, Hooray !"),
                      );
                    } else {
                      return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.disappearedPets.length,
                          separatorBuilder: (ctx, index) => const SizedBox(
                                width: 10,
                              ),
                          itemBuilder: (ctx, index) {
                            Pet pet = controller.disappearedPets[index];
                            return InkWell(
                              onTap: () => Get.toNamed(AppRoutesNames.details,
                                  arguments: {
                                    "id": pet.id,
                                    "section": "Dissapeared"
                                  }),
                              child: Card(
                                color: const Color(0xA3F28F8F),
                                elevation: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: pet.photo == null
                                            ? Image.asset(AppImageAsset.cat)
                                            : Image.network(
                                                pet.photo!,
                                                fit: BoxFit.contain,
                                              ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${pet.name}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
                ),
                DissapearedPetTitle(
                  title: "Pet Find",
                  ontap: () => Get.toNamed(AppRoutesNames.seeallF),
                ),
                Container(
                  height: Get.height * .23,
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * .03, vertical: 10),
                  child: Obx(() {
                    if (controller.disappearedPets.isEmpty) {
                      return const Center(
                        child: Text("No found pets, Sad :("),
                      );
                    } else {
                      return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.foundPets.length,
                          separatorBuilder: (ctx, index) => const SizedBox(
                                width: 10,
                              ),
                          itemBuilder: (ctx, index) {
                            Pet pet = controller.foundPets[index];
                            return InkWell(
                              onTap: () => Get.toNamed(AppRoutesNames.details,
                                  arguments: {
                                    "id": pet.id,
                                    "section": "found"
                                  }),
                              child: Card(
                                color: const Color(0xA3F28F8F),
                                elevation: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: pet.photo == null
                                              ? Image.asset(AppImageAsset.cat)
                                              : Image.network(
                                                  pet.photo!,
                                                  fit: BoxFit.contain,
                                                )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${pet.name ?? pet.species}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: Get.width * .1),
                      child: FloatingActionButton(
                          heroTag: "add",
                          shape: const CircleBorder(),
                          onPressed: () =>
                              Get.toNamed(AppRoutesNames.addanimal),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xffF8D629),
                                      Color(0xff4D8EAF)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.circular(100)),
                            height: 100,
                            width: 100,
                            child: const Icon(Icons.create_outlined),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DissapearedPetTitle extends StatelessWidget {
  final String title;
  final void Function()? ontap;
  const DissapearedPetTitle({
    super.key,
    required this.title,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontFamily: "Poppins", fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: ontap,
          child: Text(
            "See All",
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontFamily: "Poppins", decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}

class Searchfield extends StatelessWidget {
  const Searchfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .05,
      margin: EdgeInsets.symmetric(horizontal: Get.width * .07),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.secondaryColor),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              size: 30,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            hintText: "Search"),
      ),
    );
  }
}
