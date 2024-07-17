import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/homepage/homepage_controller.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/core/constants/routes_names.dart';
import 'package:petcare/data/datasource/static/static.dart';
import 'package:petcare/views/widgets/homepage/mynavbar.dart';

class Homepage extends GetView<HomepageControllerImp> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageControllerImp());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: () => Get.toNamed(AppRoutesNames.scanScreen),
        child: Transform.scale(
          scale: 1.6,
          child: Image.asset(
            AppImageAsset.actionbtn,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyNavBar(),
      body: GetBuilder<HomepageControllerImp>(
          builder: (controller) => PageTransitionSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder:
                    ((child, primaryAnimation, secondaryAnimation) =>
                        FadeThroughTransition(
                          animation: primaryAnimation,
                          secondaryAnimation: secondaryAnimation,
                          child: child,
                        )),
                child: pages.elementAt(controller.currentpage),
              )),
    );
  }
}
