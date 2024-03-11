import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> _suggestions = [];

  late bool _uninitializedProduct;

  List<ProductModel> get products => _products;
  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  List<ProductModel> get suggestions => _suggestions;
  set suggestions(List<ProductModel> suggestions) {
    _suggestions = suggestions;
    notifyListeners();
  }

  bool get uninitializedProduct => _uninitializedProduct;
  set uninitializedProduct(bool uninitializedProduct) {
    _uninitializedProduct = uninitializedProduct;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();

      _products = products;
    } catch (e) {
      print(e);
    }
  }
}

class UninitializedProductModel extends ProductModel {}