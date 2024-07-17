import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:petcare/core/constants/apilink_names.dart';
import 'package:petcare/core/functions/getToken.dart';
import 'package:petcare/data/models/pet.dart';

class Petdetails {
  Petdetails();
  Future<Pet> getdissapearedPetById(int id) async {
    final response =
        await http.get(Uri.parse('${ApiLinkNames.alldisspearedpets}/$id'));

    if (response.statusCode == 200) {
      return Pet.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load dissapeared pet');
    }
  }

  Future<Pet> getFoundPetById(int id) async {
    final response =
        await http.get(Uri.parse('${ApiLinkNames.allfoundpets}/$id'));

    if (response.statusCode == 200) {
      return Pet.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load found pet');
    }
  }

  Future<void> deletefoundPetById(int id) async {
    String token = await getToken();
    final response = await http.delete(
      Uri.parse('${ApiLinkNames.allfoundpets}/$id'),
      headers: <String, String>{
        'Accept': 'application/json',
        "Authorization": 'Bearer $token'
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 500) {
      throw Exception('Failed to delete pet');
    }
  }

  Future<void> deletedissapearedPetById(int id) async {
    String token = await getToken();
    final response = await http.delete(
      Uri.parse('${ApiLinkNames.alldisspearedpets}/$id'),
      headers: <String, String>{
        'Accept': 'application/json',
        "Authorization": 'Bearer $token'
      },
    );

    if (response.statusCode == 500) {
      throw Exception('Failed to delete pet');
    }
  }
}
