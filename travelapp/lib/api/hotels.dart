import 'package:get/get.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:travelapp/models/location_hotels.dart';

Future<List<Hotels>> extractHotelData(String? location) async {
  // Getting the response from the targeted url
  List<Hotels> listHotels = [];
  final response = await http.Client().get(Uri.parse(
      "https://www.holidify.com/places/${location}/hotels-where-to-stay.html"));

  // Status Code 200 means response has been received successfully
  if (response.statusCode == 200) {
    // Getting the html document from the response
    var document = parser.parse(response.body);
    try {
      // Scraping the first article title
      var response = document.getElementsByClassName('content-card');
      var len = response.length;

      for (int i = 0; i < len; i++) {
        var title =
            response[i].getElementsByClassName("card-heading")[0].text.trim();
        var imgurl = response[i]
            .getElementsByClassName("card-img-top")[0]
            .attributes["data-original"];
        listHotels.add(Hotels(fotoUrl: imgurl, title: title));
      }

      return listHotels;

      // print(responseString1.length);

      // Scraping the second article title

      // print(responseString3.text.trim());

      // Converting the extracted titles into
      // string and returning a list of Strings
      // return [responseString1.text.trim()];
    } catch (e) {
      return [];
    }
  } else {
    return [];
  }
}
