class PointOfInterest {
  String? fotoUrl;
  String? title;
  String? desc;
  PointOfInterest({this.fotoUrl, this.title, this.desc});

  factory PointOfInterest.fromJson(Map<String, dynamic> json) {
    return PointOfInterest(
        fotoUrl: json["foto_url"] as String,
        title: json["title"] as String,
        desc: json["desc"] as String);
  }
}
