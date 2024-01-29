import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlist = [];

  List<ProductModel> get wishlist => _wishlist;
  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel product) {
    _wishlist.contains(product)
        ? _wishlist.remove(product)
        : _wishlist.add(product);
    notifyListeners();
  }
}
