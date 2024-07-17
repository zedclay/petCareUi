import 'dart:convert';

import 'package:petcare/core/class/apiresponse.dart';
import 'package:petcare/core/constants/apilink_names.dart';
import 'package:petcare/core/functions/getToken.dart';
import 'package:petcare/data/models/user.dart';
import 'package:http/http.dart' as http;

class EditprofileData {
  EditprofileData();

  Future<Apiresponse> editProfile(
      String firstname, String lastname, String email) async {
    Apiresponse apiResponse = Apiresponse();
    String token = await getToken();
    try {
      final response =
          await http.post(Uri.parse(ApiLinkNames.editprofile), headers: {
        'Accept': 'application/json',
        "Authorization": 'Bearer $token'
      }, body: {
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
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
