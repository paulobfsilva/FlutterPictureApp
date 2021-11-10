class ImageModel {
  int id = 0;
  String title = "";
  String url = "";

  ImageModel(
    this.id,
    this.title,
    this.url,
  );

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}
