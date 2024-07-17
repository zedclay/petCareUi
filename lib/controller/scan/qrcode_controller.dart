import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:petcare/core/constants/routes_names.dart';

class QRCodeController extends GetxController {
  var qrCode = ''.obs;
  var petData = {}.obs;
  var isLoading = false.obs;

  Future<void> searchPetByQRCode(String qrCode) async {
    const url = 'http://localhost:8000/api/disappeared-pets/search-by-qr-code';
    isLoading(true);
    final response = await http.post(Uri.parse(url), headers: <String, String>{
      'Accept': 'application/json',
    }, body: {
      "qr_code_text": qrCode
    });

    if (response.statusCode == 200) {
      petData.value = jsonDecode(response.body);
      Get.toNamed(AppRoutesNames.details,
          arguments: {"id": petData['id'], "section": "dissapeared"});
    } else {
      petData.value = {};
      Get.defaultDialog(title: "Result", middleText: "There is no pet");
    }
    isLoading(false);
  }
}
