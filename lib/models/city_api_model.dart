class CityApiModel {
  String? cityId;
  String? type;
  String? cityName;

  CityApiModel({
    this.cityId,
    this.type,
    this.cityName,
  });

  factory CityApiModel.fromJson(Map<String, dynamic> json) => CityApiModel(
    cityId: json["city_id"],
    type: json["type"],
    cityName: json["city_name"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "type": type,
    "city_name": cityName,
  };
}