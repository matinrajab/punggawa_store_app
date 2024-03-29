import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';

class CheckoutProvider with ChangeNotifier {
  List<CartModel> _checkouts = [];
  bool _isLoading = false;

  List<CartModel> get checkouts => _checkouts;
  set checkouts(List<CartModel> checkouts) {
    _checkouts = checkouts;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
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
    int total = 0;
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
