import 'package:get/get_connect/http/src/utils/utils.dart';

class Food {
  String? fotoUrl;
  String? title;
  Food({this.fotoUrl, this.title});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      fotoUrl: json["foto_url"] as String,
      title: json["title"] as String,
    );
  }
}
