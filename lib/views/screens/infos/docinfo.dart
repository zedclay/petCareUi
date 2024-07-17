import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/views/widgets/auth/cutombtn1.dart';

class Docinfo extends StatelessWidget {
  const Docinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dr.Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0x804D8EAF),
      ),
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            SizedBox(
              height: Get.height * .4,
              width: Get.width,
              child: Image.asset(
                AppImageAsset.doc,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                top: Get.height * .3,
                child: ClipPath(
                  clipper: OvalTopBorderClipper(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: Get.height * .07),
                    height: Get.height,
                    width: Get.width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Dr.Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Clinic name",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Address",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: AppColor.highlightColor,
                                    fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Custombtn1(
                              padding: Get.width * .2,
                              text: "Phone number",
                              onpressed: () {}),
                          const SizedBox(
                            height: 15,
                          ),
                          const RatingStars(
                            valueLabelVisibility: false,
                            starSize: 40,
                            starCount: 5,
                            value: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
