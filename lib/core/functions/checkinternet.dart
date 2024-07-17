import 'dart:io';

import 'package:get/get.dart';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");

    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return _.printError(info: "there is no connection");
  }
}
