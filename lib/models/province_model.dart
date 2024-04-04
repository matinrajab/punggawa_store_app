class ProvinceModel {
  int? id;
  String? name;
  String? provinceId;

  ProvinceModel({
    this.id,
    this.name,
    this.provinceId,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
    id: json["id"],
    name: json["name"],
    provinceId: json["province_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "province_id": provinceId,
  };
}