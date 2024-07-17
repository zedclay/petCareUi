import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/core/constants/color.dart';
import 'package:petcare/core/constants/imageassets.dart';
import 'package:petcare/core/constants/routes_names.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: Get.width * .03),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Center(
                child: Image.asset(AppImageAsset.necklace),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  "Scan your card with NFC",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2)]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    backgroundColor: AppColor.highlightColor),
                onPressed: () => Get.toNamed(AppRoutesNames.nfcScan),
                child: const Text(
                  "NFC",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  "Scan your QR code",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2)]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * .05, vertical: 8),
                    backgroundColor: AppColor.backgroundColor),
                onPressed: () => Get.toNamed(AppRoutesNames.qrcodeScan),
                child: const Text(
                  "QR Code",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
