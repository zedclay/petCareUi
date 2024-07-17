import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare/core/services/services.dart';
import 'package:petcare/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Varela Round",
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: "Varela Round",
              fontSize: 24,
              letterSpacing: -.33,
            ),
            bodyLarge: TextStyle(
                fontFamily: "Varela Round",
                fontSize: 30,
                letterSpacing: -.33,
                fontWeight: FontWeight.w400),
            bodyMedium: TextStyle(
                fontFamily: "Varela Round",
                fontSize: 24,
                letterSpacing: -.33,
                fontWeight: FontWeight.w400),
            bodySmall: TextStyle(
                fontFamily: "Varela Round",
                fontSize: 18,
                letterSpacing: -.33,
                fontWeight: FontWeight.w400),
            labelSmall: TextStyle(
                fontFamily: "Rounded M plus",
                fontSize: 16,
                fontWeight: FontWeight.w700),
          )),
      title: 'Pet Care',
      getPages: routes,
    );
  }
}
