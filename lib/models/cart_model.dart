import 'package:shoe_store_app/models/product_model.dart';

class CartModel {
  ProductModel? product;
  int quantity;

  CartModel({
    this.product,
    this.quantity = 1,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    product: ProductModel.fromJson(json["product"]),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "product": product!.toJson(),
    "quantity": quantity,
  };
}
