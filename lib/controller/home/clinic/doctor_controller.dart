import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/core/constants/apilink_names.dart';
import 'dart:convert';

import 'package:petcare/data/models/doctor.dart';

class DoctorController extends GetxController {
  var petDoctors = <Doctor>[].obs;
  var isLoading = true.obs;

  TextEditingController name = TextEditingController();
  TextEditingController clinicname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> doctorForm = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchPetDoctors();
  }

  Future<void> handleRefresh() {
    return Future.delayed(const Duration(seconds: 1), () => fetchPetDoctors());
  }

  void fetchPetDoctors() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(ApiLinkNames.allDocs));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        petDoctors.value = data.map((json) => Doctor.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load pet doctors');
      }
    } finally {
      isLoading(false);
    }
  }

  void createPetDoctor() async {
    if (doctorForm.currentState!.validate()) {
      try {
        isLoading(true);
        final response = await http
            .post(Uri.parse(ApiLinkNames.addDoc), headers: <String, String>{
          'Accept': 'application/json;',
        }, body: {
          'name': name.text,
          'clinic_name': clinicname.text,
          'address': address.text,
          'phone_number': phone.text,
        });
        print(response.statusCode);
        print(response.body);
        if (response.statusCode == 201) {
          Get.back();
          Get.snackbar('Success', 'Pet doctor added successfully');
          Get.back();
        } else {
          Get.snackbar('Error', 'Failed to add pet doctor');
        }
      } finally {
        isLoading(false);
      }
    }
  }
}
