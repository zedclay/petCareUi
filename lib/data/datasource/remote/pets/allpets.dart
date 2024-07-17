import 'dart:convert';

import 'package:petcare/core/constants/apilink_names.dart';
import 'package:http/http.dart' as http;
import 'package:petcare/data/models/pet.dart';

class AllpetsData {
  AllpetsData();

  Future<List<Pet>> getAlldissapearedPets() async {
    final response = await http.get(Uri.parse(ApiLinkNames.alldisspearedpets));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Pet> pets = body.map((dynamic item) => Pet.fromJson(item)).toList();
      return pets;
    } else {
      throw Exception('Failed to load pets');
    }
  }

  Future<List<Pet>> getAllFoundPets() async {
    final response = await http.get(Uri.parse(ApiLinkNames.allfoundpets));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Pet> pets = body.map((dynamic item) => Pet.fromJson(item)).toList();
      return pets;
    } else {
      throw Exception('Failed to load pets');
    }
  }

  Future<List<Pet>> getDissapearedPetsByCategory(String category) async {
    final response = await http
        .get(Uri.parse('${ApiLinkNames.dissapearedFilteredPets}/$category'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Pet> pets = body.map((dynamic item) => Pet.fromJson(item)).toList();
      return pets;
    } else {
      throw Exception('Failed to load pets');
    }
  }

  Future<List<Pet>> getFoundPetsByCategory(String category) async {
    final response = await http.get(
        Uri.parse('${ApiLinkNames.foundFilteredPets}/$category'),
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Pet> pets = body.map((dynamic item) => Pet.fromJson(item)).toList();
      return pets;
    } else {
      throw Exception('Failed to load pets');
    }
  }
}
