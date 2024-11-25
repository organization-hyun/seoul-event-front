class SeoulEventModel {
  late final int id;
  late final String title, region, location, imageUrl;

  SeoulEventModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        region = json['region'],
        location = json['location'],
        imageUrl = json['imageUrl'];
}
