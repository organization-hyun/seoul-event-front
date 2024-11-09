class SeoulEventModel {
  late final String title, imageUrl;

  SeoulEventModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        imageUrl = json['imageUrl'];
}
