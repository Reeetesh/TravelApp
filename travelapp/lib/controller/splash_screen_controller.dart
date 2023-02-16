import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travelapp/views/home.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;
  TextEditingController controller = TextEditingController();
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 2500));
    Get.to(()=>const HomePage());
  }
// instances for them to be called

}
