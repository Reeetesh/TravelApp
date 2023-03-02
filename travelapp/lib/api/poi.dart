import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import '../models/location_poi.dart';

Future<List<PointOfInterest>> extractPOIData(String? location) async {
  // Getting the response from the targeted url
  List<PointOfInterest> listPOI = [];
  final response = await http.Client().get(Uri.parse(
      "https://www.holidify.com/places/$location/sightseeing-and-things-to-do.html"));

  // Status Code 200 means response has been received successfully
  if (response.statusCode == 200) {
    // Getting the html document from the response
    var document = parser.parse(response.body);
    try {
      // Scraping the first article title
      var response = document.getElementsByClassName('content-card');

      for (int i = 0; i < response.length; i++) {
        var title =
            response[i].getElementsByClassName("card-heading")[0].text.trim();
        var url = response[i]
            .getElementsByClassName("card-img-top")[0]
            .attributes["data-original"];
        var desc =
            response[i].getElementsByClassName("card-text")[0].text.trim();
        listPOI.add(PointOfInterest(fotoUrl: url, title: title, desc: desc));
      }
      return listPOI;
    } catch (e) {
      return [];
    }
  } else {
    return [];
  }
}
