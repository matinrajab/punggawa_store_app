import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/services/raja_ongkir_service.dart';

class CheckoutProvider with ChangeNotifier {
  List<CartModel> _checkouts = [];
  int _shippingPrice = 0;
  bool _isLoading = false;

  List<CartModel> get checkouts => _checkouts;
  set checkouts(List<CartModel> checkouts) {
    _checkouts = checkouts;
    notifyListeners();
  }

  int get shippingPrice => _shippingPrice;
  set shippingPrice(int shippingPrice) {
    _shippingPrice = shippingPrice;
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

  Future<void> getShippingPrice(String cityId) async {
    try {
      int shippingPrice = await RajaOngkirService().getShippingPrice(
        destinationId: cityId,
        totalItems: totalItems(),
      );

      _shippingPrice = shippingPrice;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  resetData() {
    _checkouts.clear();
    _shippingPrice = 0;
    notifyListeners();
  }

  notify(){
    notifyListeners();
  }
}
