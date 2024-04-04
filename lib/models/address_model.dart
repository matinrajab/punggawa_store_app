import 'package:shoe_store_app/models/category_model.dart';
import 'package:shoe_store_app/models/city_model.dart';
import 'package:shoe_store_app/models/province_model.dart';

class AddressModel {
  int? id;
  String? name;
  String? phone;
  ProvinceModel? province;
  CityModel? city;
  String? detail;
  String? additional;
  CategoryModel? addressCategory;

  AddressModel({
    this.id,
    this.name,
    this.phone,
    this.province,
    this.city,
    this.detail,
    this.additional,
    this.addressCategory,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    detail: json["detail"],
    province: ProvinceModel.fromJson(json["province"]),
    city: CityModel.fromJson(json["city"]),
    additional: json["additional"],
    addressCategory: CategoryModel.fromJson(json["address_category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "province": province!.toJson(),
    "city": city!.toJson(),
    "detail": detail,
    "additional": additional,
    "address_category": addressCategory!.toJson(),
  };
}