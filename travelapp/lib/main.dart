import 'package:flutter/material.dart';
import "package:get/get.dart";

import 'package:travelapp/views/home.dart';
import 'package:travelapp/views/splashscreen.dart';

import 'controller/splash_screen_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final splashController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home:
          splashController.animate.value == false ? splashScreen() : HomePage(),
    );
  }
}
