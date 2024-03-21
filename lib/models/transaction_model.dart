import 'package:shoe_store_app/models/category_model.dart';
import 'package:shoe_store_app/models/item_model.dart';
import 'package:shoe_store_app/models/payment_method_model.dart';

class TransactionModel {
  int? id;
  PaymentMethodModel? paymentMethod;
  String? name;
  String? phone;
  String? address;
  CategoryModel? addressCategory;
  int? totalPrice;
  int? shippingPrice;
  String? status;
  List<ItemModel>? items;

  TransactionModel({
    this.id,
    this.paymentMethod,
    this.name,
    this.phone,
    this.address,
    this.addressCategory,
    this.totalPrice,
    this.shippingPrice,
    this.status,
    this.items,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        paymentMethod: PaymentMethodModel.fromJson(json["payment_method"]),
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        addressCategory: CategoryModel.fromJson(json["address_category"]),
        totalPrice: json["total_price"],
        shippingPrice: json["shipping_price"],
        status: json["status"],
        items: List<ItemModel>.from(
            json["items"].map((x) => ItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_method": paymentMethod,
        "name": name,
        "phone": phone,
        "address": address,
        "address_category": addressCategory,
        "total_price": totalPrice,
        "shipping_price": shippingPrice,
        "status": status,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
