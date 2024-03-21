import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';

class CheckoutProvider with ChangeNotifier {
  List<CartModel> _checkouts = [];

  List<CartModel> get checkouts => _checkouts;
  set checkouts(List<CartModel> checkouts) {
    _checkouts = checkouts;
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var checkouts in _checkouts) {
      total += checkouts.quantity;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var checkouts in _checkouts) {
      total += checkouts.quantity * checkouts.product!.price!;
    }
    return total;
  }

  resetData() {
    _checkouts.clear();
    notifyListeners();
  }
}
