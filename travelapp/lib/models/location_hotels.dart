class Hotels {
  String? fotoUrl;
  String? title;
  Hotels({this.fotoUrl, this.title});

  factory Hotels.fromJson(Map<String, dynamic> json) {
    return Hotels(
      fotoUrl: json["foto_url"] as String,
      title: json["title"] as String,
    );
  }
}
