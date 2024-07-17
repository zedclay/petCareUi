import 'dart:convert';

import 'package:petcare/core/class/apiresponse.dart';
import 'package:petcare/core/constants/apilink_names.dart';
import 'package:petcare/core/functions/getToken.dart';
import 'package:http/http.dart' as http;

class Changepassdata {
  Changepassdata();

  Future<Apiresponse> changePass(
      String oldpass, String newpass, String confirmpass) async {
    Apiresponse apiResponse = Apiresponse();
    String token = await getToken();
    try {
      final response =
          await http.post(Uri.parse(ApiLinkNames.changepass), headers: {
        'Accept': 'application/json',
        "Authorization": 'Bearer $token'
      }, body: {
        "old_password": oldpass,
        "new_password": newpass,
        "new_password_confirmation": confirmpass,
      });

      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['message'];
          break;
        case 401:
          final message = jsonDecode(response.body)['message'];
          apiResponse.error = message;
          break;
        case 422:
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
