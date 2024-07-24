class PosterModel {
  String? id;
  String? title;

  PosterModel({
    required this.id,
    required this.title,
  });

  PosterModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
  }
}