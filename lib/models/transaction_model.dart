import 'package:shoe_store_app/models/item_model.dart';

class TransactionModel {
  int? id;
  String? address;
  String? paymentMethod;
  num? totalPrice;
  num? shippingPrice;
  String? status;
  List<ItemModel>? items;

  TransactionModel({
    this.id,
    this.address,
    this.paymentMethod,
    this.totalPrice,
    this.shippingPrice,
    this.status,
    this.items,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    print('pertransaksi json: $json');
    return TransactionModel(
      id: json["id"],
      address: json["address"],
      paymentMethod: json["payment_method"],
      totalPrice: json["total_price"],
      shippingPrice: json["shipping_price"],
      status: json["status"],
      items:
          List<ItemModel>.from(json["items"].map((x) => ItemModel.fromJson(x))),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "payment_method": paymentMethod,
        "total_price": totalPrice,
        "shipping_price": shippingPrice,
        "status": status,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
