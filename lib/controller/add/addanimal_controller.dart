import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petcare/core/constants/apilink_names.dart';
import 'package:petcare/core/functions/getToken.dart';
import 'package:petcare/data/datasource/remote/pets/createpet.dart';
import 'package:http/http.dart' as http;

class AddanimalController extends GetxController {
  Createpet createpetdata = Createpet();
  bool isloading = false;
  TextEditingController name = TextEditingController();
  TextEditingController species = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController foundname = TextEditingController();
  TextEditingController foundspecies = TextEditingController();
  TextEditingController foundaddress = TextEditingController();
  TextEditingController foundphone = TextEditingController();

  String? cat;
  String? sex;

  GlobalKey<FormState> addanimalform = GlobalKey<FormState>();

  var selectedImage = Rxn<File>();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  choosepet(String category) {
    cat = category;
    update();
  }

  choosesex(String mysex) {
    sex = mysex;
    update();
  }

  Future<void> createFoundPet() async {
    const url = ApiLinkNames.allfoundpets;
    String token = await getToken();

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['category'] = cat!
      ..fields['species'] = foundspecies.text
      ..fields['address'] = foundaddress.text
      ..fields['phone_number'] = foundphone.text
      ..fields['sex'] = sex!;

    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (selectedImage.value != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'photo',
        selectedImage.value!.path,
      ));
    }

    var response = await request.send();
    print(response.statusCode);
    print(jsonDecode(await response.stream.bytesToString()));
    if (response.statusCode == 201) {
      var responseData = await response.stream.bytesToString();
      var petData = jsonDecode(responseData);
      // Handle success response
      print('Pet created successfully: $petData');
    } else {
      // Handle error response
      print('Failed to create pet');
    }
  }

  Future<void> createDissapearedPet() async {
    const url = ApiLinkNames.alldisspearedpets;
    String token = await getToken();

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['name'] = name.text
      ..fields['category'] = cat!
      ..fields['species'] = species.text
      ..fields['address'] = address.text
      ..fields['phone_number'] = phone.text.toString()
      ..fields['sex'] = sex!;

    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (selectedImage.value != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'photo',
        selectedImage.value!.path,
      ));
    }

    var response = await request.send();
    print(response.statusCode);
    print(jsonDecode(await response.stream.bytesToString()));
    if (response.statusCode == 201) {
      var responseData = await response.stream.bytesToString();
      var petData = jsonDecode(responseData);
      // Handle success response
      print('Pet created successfully: $petData');
    } else {
      // Handle error response
      print('Failed to create pet');
    }
  }
}
