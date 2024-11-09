class SeoulEventModel {
  late final String title, region, location, imageUrl;

  SeoulEventModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        region = json['region'],
        location = json['location'],
        imageUrl = json['imageUrl'];
}
