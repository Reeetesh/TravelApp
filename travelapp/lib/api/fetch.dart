import 'dart:convert';
import 'package:travelapp/api/food.dart';
import 'package:travelapp/api/hotels.dart';
import 'package:travelapp/api/poi.dart';
import 'package:travelapp/models/location_data.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/models/location_food.dart';
import 'package:travelapp/models/location_hotels.dart';
import 'package:travelapp/models/location_poi.dart';

Future<LocationData> getPOI(String? location) async {
  LocationData? locationdata;
  List<PointOfInterest> listPOI = [];
  List<Food> listFood = [];
  List<Hotels> listHotels = [];
  await extractPOIData(location).then((value) => {
        for (int i = 0; i < value.length; i++) {listPOI.add(value[i])}
      });
  await extractHotelData(location).then((value) => {
        for (int i = 0; i < value.length; i++) {listHotels.add(value[i])}
      });
  await extractFoodData(location).then((value) => {
        for (int i = 0; i < value.length; i++) {listFood.add(value[i])}
      });

  locationdata = LocationData(listPOI, listFood, listHotels);

  return locationdata;
}
