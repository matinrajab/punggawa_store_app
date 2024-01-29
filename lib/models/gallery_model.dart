class GalleryModel {
  int? id;
  String? url;

  GalleryModel({
    this.id,
    this.url,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
    id: json["id"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
  };
}
