

class PointOfInterest {
  String? fotoUrl;
  String? title;
  PointOfInterest({this.fotoUrl, this.title});

  factory PointOfInterest.fromJson(Map<String, dynamic> json) {
    return PointOfInterest(
      fotoUrl: json["foto_url"] as String,
      title: json["title"] as String,
    );
  }
}
