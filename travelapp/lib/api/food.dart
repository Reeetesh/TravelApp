import 'package:get/get.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:travelapp/models/location_food.dart';

Future<List<Food>> extractFoodData(String? location) async {
  // Getting the response from the targeted url
  List<Food> listFood = [];
  final response = await http.Client()
      .get(Uri.parse("https://restaurant-guru.in/${location}#restaurant-list"));

  // Status Code 200 means response has been received successfully
  if (response.statusCode == 200) {
    // Getting the html document from the response
    var document = parser.parse(response.body);
    try {
      // Scraping the first article titlehttps://restaurant-guru.in/${location}#restaurant-list

      var foodTitle = document.getElementsByClassName('notranslate');
      var foodImgUrl = document.getElementsByClassName('restaurant-img');
      var len = foodImgUrl.length;
      for (int i = 0; i < len; i++) {
        var title = (foodTitle[i].text.trim());
        var imgurl = (foodImgUrl[i].attributes['data-src']);
        listFood.add(Food(fotoUrl: imgurl, title: title));
        print(listFood.length);
      }
      
      return listFood;

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
