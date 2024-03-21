import 'package:shoe_store_app/models/category_model.dart';
import 'package:shoe_store_app/models/gallery_model.dart';

class ProductModel {
  int? id;
  String? name;
  num? price;
  String? description;
  String? tags;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryModel? category;
  List<GalleryModel>? galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.galleries,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        tags: json["tags"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: CategoryModel.fromJson(json["product_category"]),
        galleries: List<GalleryModel>.from(
            json["galleries"].map((x) => GalleryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "tags": tags,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "product_category": category!.toJson(),
        "galleries": List<dynamic>.from(galleries!.map((x) => x.toJson())),
      };
}

class UninitializedProductModel extends ProductModel {}