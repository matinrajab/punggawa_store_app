class RegionApiModel {
  String? id;
  String? text;

  RegionApiModel({
    this.id,
    this.text,
  });

  factory RegionApiModel.fromJson(Map<String, dynamic> json) => RegionApiModel(
    id: json["id"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
  };
}