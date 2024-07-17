import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

import 'package:petcare/core/constants/routes_names.dart';

class NFCController extends GetxController {
  var nfcTag = ''.obs;
  var petData = {}.obs;
  var isLoading = false.obs;

  Future<void> searchPetByNFC() async {
    const url = 'http://10.0.3.2:8000/api/disappeared-pets/search-by-qr-code';
    isLoading(true);

    try {
      NFCTag tag = await FlutterNfcKit.poll();
      nfcTag.value = tag.id;

      final response = await http.post(Uri.parse(url), headers: <String, String>{
        'Accept': 'application/json',
      }, body: {
        "qr_code_text": nfcTag.value
      });

      if (response.statusCode == 200) {
        petData.value = jsonDecode(response.body);
        Get.toNamed(AppRoutesNames.details,
            arguments: {"id": petData['id'], "section": "dissapeared"});
      } else {
        petData.value = {};
        Get.defaultDialog(title: "Result", middleText: "There is no pet");
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: "NFC scan failed: $e");
    } finally {
      isLoading(false);
    }
  }
}
