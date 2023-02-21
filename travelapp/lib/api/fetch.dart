import 'dart:convert';
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

  var response = await http.get(Uri.parse(apiURL(location)));

  if (response.statusCode == 200) {
    var jsonString = jsonDecode(response.body);
    var restPOI = jsonString["Point_of_Interests"];
    var restFood = jsonString["Food"];
    var restHotels = jsonString["Hotels"];
    listPOI = restPOI
        .map<PointOfInterest>((json) => PointOfInterest.fromJson(json))
        .toList();
    listFood = restFood.map<Food>((json) => Food.fromJson(json)).toList();
    listHotels =
        restHotels.map<Hotels>((json) => Hotels.fromJson(json)).toList();
  }
  // print(response.body);
  locationdata = LocationData(listPOI, listFood, listHotels);
  return locationdata;
}

String apiURL(var location) {
  String url;
  url = "http://192.168.20.179:3000/travel?id=$location";
  return url;
}
