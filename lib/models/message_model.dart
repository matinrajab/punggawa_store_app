import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/models/uninitialized_product_model.dart';

class MessageModel {
  String? message;
  int? userId;
  String? userName;
  String? userImage;
  bool? isFromUser;
  ProductModel? product;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageModel({
    this.message,
    this.userId,
    this.userName,
    this.userImage,
    this.isFromUser,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json['message'],
        userId: json['user_id'],
        userName: json['user_name'],
        userImage: json['user_image'],
        isFromUser: json['is_from_user'],
        product: json['product'].isEmpty
            ? UninitializedProductModel()
            : ProductModel.fromJson(json['product']),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user_id': userId,
        'user_name': userName,
        'user_image': userImage,
        'is_from_user': isFromUser,
        'product':
            product is UninitializedProductModel ? {} : product!.toJson(),
        'created_at': createdAt.toString(),
        'updated_at': updatedAt.toString(),
      };
}
