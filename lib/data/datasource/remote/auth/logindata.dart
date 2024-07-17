import 'dart:convert';

import 'package:petcare/core/class/apiresponse.dart';
import 'package:petcare/core/constants/apilink_names.dart';
import 'package:petcare/data/models/user.dart';
import 'package:http/http.dart' as http;

class Logindata {
  Logindata();

  Future<Apiresponse> loginUser(String email, String pass) async {
    Apiresponse apiResponse = Apiresponse();
    try {
      final response =
          await http.post(Uri.parse(ApiLinkNames.signin), headers: {
        'Accept': 'application/json'
      }, body: {
        "email": email,
        "password": pass,
      });

      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode(response.body));
          break;
        case 401:
          final message = jsonDecode(response.body)['message'];
          apiResponse.error = message;
          break;
        default:
          apiResponse.error = "somethingWentWrong";
          break;
      }
    } catch (e) {
      apiResponse.error = "serverError";
    }
    return apiResponse;
  }
}
