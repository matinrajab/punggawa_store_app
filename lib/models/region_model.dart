class RegionModel {
  int? id;
  String? name;
  String? idFromApi;

  RegionModel({
    this.id,
    this.name,
    this.idFromApi,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    id: json["id"],
    name: json["name"],
    idFromApi: json["id_from_api"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "id_from_api": idFromApi,
  };
}