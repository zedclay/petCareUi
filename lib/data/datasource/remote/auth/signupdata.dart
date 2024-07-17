import 'dart:convert';

import 'package:petcare/core/class/apiresponse.dart';
import 'package:petcare/core/constants/apilink_names.dart';
import 'package:petcare/data/models/user.dart';
import 'package:http/http.dart' as http;

class Signupdata {
  Signupdata();

  Future<Apiresponse> signupUser(
      String firstname, String lastname, String email, String pass) async {
    Apiresponse apiResponse = Apiresponse();
    try {
      final response =
          await http.post(Uri.parse(ApiLinkNames.signup), headers: {
        'Accept': 'application/json'
      }, body: {
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
        "password": pass,
      });
      print(response.body);
      print("================\n\n==============");
      print(response.statusCode);

      switch (response.statusCode) {
        case 201:
          apiResponse.data = User.fromJson(jsonDecode(response.body));
          apiResponse.error = null;
          break;
        case 422:
          final errors = jsonDecode(response.body)['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
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
