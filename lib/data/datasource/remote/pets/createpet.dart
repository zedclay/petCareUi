import 'dart:convert';
import 'dart:io';

import 'package:petcare/core/constants/apilink_names.dart';
import 'package:petcare/core/functions/getToken.dart';
import 'package:petcare/data/models/pet.dart';
import 'package:http/http.dart' as http;

class Createpet {
  Createpet();

  Future<Pet> createDisappearedPet(String cat, String name, String species,
      String sex, String address, String phone) async {
    String token = await getToken();

    final response = await http.post(
      Uri.parse(ApiLinkNames.alldisspearedpets),
      headers: <String, String>{
        'Accept': 'application/json',
        "Authorization": 'Bearer $token'
      },
      body: {
        "category": cat,
        "name": name,
        "species": species,
        "sex": sex,
        "address": address,
        "phone_number": phone,

      },
    );

    if (response.statusCode == 201) {
      return Pet.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create disappeared pet');
    }
  }
  

  Future<Pet> createFoundPet(String cat, String species, String sex,
      String address, String phone) async {
    String token = await getToken();

    final response = await http.post(
      Uri.parse(ApiLinkNames.allfoundpets),
      headers: <String, String>{
        'Accept': 'application/json',
        "Authorization": 'Bearer $token'
      },
      body: {
        "category": cat,
        "species": species,
        "sex": sex,
        "address": address,
        "phone_number": phone,
      },
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 201) {
      return Pet.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create found pet');
    }
  }
}
