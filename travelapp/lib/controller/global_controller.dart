import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:travelapp/api/fetch.dart';
import 'package:travelapp/models/location_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp/api/fetch.dart';
import 'package:travelapp/views/home.dart';

class GlobalController extends GetxController {
  RxBool _isLoading = false.obs;
  RxBool animate = false.obs;
  TextEditingController controller = TextEditingController();
  RxBool checkLoading() => _isLoading;
  changeLoading() {
    if (_isLoading.value == true) {
      _isLoading.value = false;
    } else {
      _isLoading.value = true;
    }
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(HomePage());
  }
// instances for them to be called

}
