import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/core/constants/routes_names.dart';

import 'package:petcare/views/screens/home/home.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
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
              horizontal: Get.width * .1, vertical: Get.height * .01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff4D8EAF)),
          child: const Text("PET SUPLLIES"),
        ),
      ),
      body: SafeArea(
        child: Form(
          child: Stack(
            children: [
              ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Searchfield(),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: Get.height * .24,
                    margin: EdgeInsets.symmetric(horizontal: Get.width * .03),
                    child: Card(
                      elevation: 3,
                      color: const Color(0xffFDFBF6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                AppImageAsset.shop1,
                                fit: BoxFit.contain,
                                scale: 1.6,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pet Supplies",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                              ),
                              Text("Address",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: 12, color: Colors.grey)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const RatingStars(
                                    valueLabelVisibility: false,
                                    starColor: AppColor.backgroundColor,
                                    starCount: 5,
                                    starSize: 12,
                                    value: 3.5,
                                  ),
                                  Text(
                                    "5.0  {100 reviews}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Get.width * .13, top: 30),
                                child: TextButton(
                                    onPressed: () =>
                                        Get.toNamed(AppRoutesNames.petinfo),
                                    child: const Text(
                                      "More information",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.black),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * .24,
                    margin: EdgeInsets.symmetric(horizontal: Get.width * .03),
                    child: Card(
                      elevation: 3,
                      color: const Color(0xffFDFBF6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                AppImageAsset.shop2,
                                fit: BoxFit.contain,
                                scale: 1.6,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pet Supplies",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                              ),
                              Text("Address",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: 12, color: Colors.grey)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const RatingStars(
                                    valueLabelVisibility: false,
                                    starColor: AppColor.backgroundColor,
                                    starCount: 5,
                                    starSize: 12,
                                    value: 3.5,
                                  ),
                                  Text(
                                    "5.0  {100 reviews}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Get.width * .13, top: 30),
                                child: TextButton(
                                    onPressed: () =>
                                        Get.toNamed(AppRoutesNames.petinfo),
                                    child: const Text(
                                      "More information",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.black),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 30,
                bottom: 30,
                child: FloatingActionButton(
                    heroTag: "shop",
                    shape: const CircleBorder(),
                    onPressed: () => Get.toNamed(AppRoutesNames.addshop),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xffF8D629), Color(0xff4D8EAF)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(100)),
                      height: 100,
                      width: 100,
                      child: const Icon(Icons.create_outlined),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
