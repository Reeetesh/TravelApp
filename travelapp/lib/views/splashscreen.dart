import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp/controller/splash_screen_controller.dart';

class splashScreen extends StatelessWidget {
  splashScreen({super.key});
  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background2.jpg"), fit: BoxFit.cover),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Lottie.asset("animations/animation4.json")),
      // child: Text("Hello"),
    );
  }
}
