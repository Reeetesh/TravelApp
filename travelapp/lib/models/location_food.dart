class Food {
  String? fotoUrl;
  String? title;
  Food({this.fotoUrl, this.title});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      fotoUrl: json["foto_url"] ?? "xyz",
      title: json["title"] as String,
    );
  }
}
