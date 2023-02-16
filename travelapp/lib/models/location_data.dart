import 'package:travelapp/models/location_food.dart';
import 'package:travelapp/models/location_hotels.dart';
import 'package:travelapp/models/location_poi.dart';

class LocationData {
  final List<PointOfInterest>? poi;
  final List<Food>? food;
  final List<Hotels>? hotel;

  LocationData([this.poi, this.food, this.hotel]);
}
