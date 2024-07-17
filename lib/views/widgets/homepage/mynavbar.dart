import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/controller/homepage/homepage_controller.dart';
import 'package:petcare/views/widgets/homepage/navbar_icons_icons.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageControllerImp>(
      builder: (controller) => AnimatedBottomNavigationBar(
          splashSpeedInMilliseconds: 500,
          splashRadius: 30,
          elevation: 10,
          notchSmoothness: NotchSmoothness.softEdge,
          splashColor: Colors.orange,
          icons: const [
            NavbarIcons.home,
            NavbarIcons.stethoscope,
            NavbarIcons.shop,
            NavbarIcons.person_outline,
          ],
          activeColor: const Color(0xffF8D629),
          inactiveColor: Colors.black,
          gapLocation: GapLocation.center,
          activeIndex: controller.currentpage,
          onTap: (index) {
            controller.changepage(index);
          }),
    );
  }
}
