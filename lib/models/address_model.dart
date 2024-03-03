import 'package:shoe_store_app/models/category_model.dart';
import 'package:shoe_store_app/models/region_model.dart';

class AddressModel {
  int? id;
  String? name;
  String? phone;
  RegionModel? province;
  RegionModel? city;
  RegionModel? district;
  RegionModel? postalCode;
  String? detail;
  String? additional;
  CategoryModel? addressCategory;

  AddressModel({
    this.id,
    this.name,
    this.phone,
    this.province,
    this.city,
    this.district,
    this.postalCode,
    this.detail,
    this.additional,
    this.addressCategory,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    detail: json["detail"],
    province: RegionModel.fromJson(json["province"]),
    city: RegionModel.fromJson(json["city"]),
    district: RegionModel.fromJson(json["district"]),
    postalCode: RegionModel.fromJson(json["postal_code"]),
    additional: json["additional"],
    addressCategory: CategoryModel.fromJson(json["address_category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "province": province!.toJson(),
    "city": city!.toJson(),
    "district": district!.toJson(),
    "postal_code": postalCode!.toJson(),
    "detail": detail,
    "additional": additional,
    "address_category": addressCategory!.toJson(),
  };
}