import 'package:shoe_store_app/models/product_model.dart';

class ItemModel {
  int? id;
  int? quantity;
  ProductModel? product;

  ItemModel({
    this.id,
    this.quantity,
    this.product,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"] as int,
        quantity: json["quantity"] as int,
        product: ProductModel.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "product": product!.toJson(),
      };
}
