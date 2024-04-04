class ProvinceApiModel {
  String? provinceId;
  String? province;

  ProvinceApiModel({
    this.provinceId,
    this.province,
  });

  factory ProvinceApiModel.fromJson(Map<String, dynamic> json) => ProvinceApiModel(
    provinceId: json["province_id"],
    province: json["province"],
  );

  Map<String, dynamic> toJson() => {
    "province_id": provinceId,
    "province": province,
  };
}