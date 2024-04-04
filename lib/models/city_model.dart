import 'package:shoe_store_app/models/category_model.dart';

class CityModel {
  int? id;
  CategoryModel? cityType;
  String? name;
  String? cityId;

  CityModel({
    this.id,
    this.cityType,
    this.name,
    this.cityId,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json["id"],
    cityType: CategoryModel.fromJson(json["city_type"]),
    name: json["name"],
    cityId: json["city_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_type": cityType!.toJson(),
    "name": name,
    "city_id": cityId,
  };
}