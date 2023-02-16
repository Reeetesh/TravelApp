import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:travelapp/models/location_data.dart';

class ListController extends GetxController {
  var locationData = LocationData().obs;

  LocationData getData() {
    return locationData.value;
  }
}
